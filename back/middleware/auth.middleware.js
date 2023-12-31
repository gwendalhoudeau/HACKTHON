const jwt = require('jsonwebtoken')
const UserModel = require('../models/user.model')

module.exports.checkUser = (req,res,next) => {
    const token = req.cookies.jwt
    if (token) {
        jwt.verify(token,process.env.TOKEN_SECRET, async (err, decodedToken) => {
            if(err) {
                res.locals.user = null
                res.cookie('jwt','',{maxAge:1})
                next()
            } else {
                let user = await UserModel.findById(decodedToken.id)
                res.locals.user = user
                next()
            }
        })
    } else {
        res.locals = null
        next()
    }
}

module.exports.requireAuth = (req,res,next) => {
    console.log("reqrequire:",req.cookies)
    const token = req.cookies.jwt
    console.log('token dans requireauth:',token)
    if (token) {
        console.log(5464654654654)
        jwt.verify(token, process.env.TOKEN_SECRET, async (err,decodedToken) => {
            if (err) {
                console.log(1)
                console.log(err)
            } else {
                console.log(2)
                console.log("decodedtoken:",decodedToken.id)
                next()
            }
        })
    } else {
        console.log('Pas de token')
    }
}