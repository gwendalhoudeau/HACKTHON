const UserModel = require('../models/user.model')
const jwt = require('jsonwebtoken')
const { signUpErrors, signInErrors } = require('../utils/error.utils')

const createToken= (id) => {
    console.log('Create token')
    return jwt.sign({id},process.env.TOKEN_SECRET, {
        expiresIn: maxAge
    })
}
const maxAge = 60*60*1000

module.exports.signUp = async (req,res) => {
    const {pseudo,email,password} = req.body
    
    try{
        const user = await UserModel.create({pseudo,email,password})
        res.status(201).json({user:user._id})
    }
    catch(err){
        const errors = signUpErrors(err)
        res.status(200).send({errors})
    }
}

module.exports.signIn = async (req,res) => {
    const {email,password} = req.body

    try {
        const user = await UserModel.login(email,password)
        const token = createToken(user._id)
        console.log(token)
        res.cookie('jwt',token, {httpOnly: true, maxAge:maxAge})
        res.status(200).json({user:user._id})
    } catch(err) {
        const errors = signInErrors(err)
        res.status(200).json({errors})
    }

}

module.exports.logout = (req,res) => {
    res.cookie('jwt','',{maxAge:1})
    res.redirect('/')
}