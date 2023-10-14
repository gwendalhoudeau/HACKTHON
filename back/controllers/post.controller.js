const PostModel = require('../models/post.model')
const UserModel = require('../models/user.model')
const fs = require('fs')
const { promisify } = require('util')
const { uploadErrors } = require('../utils/error.utils')
const pipeline = promisify(require('stream').pipeline)
const ObjectID = require('mongoose').Types.ObjectId

module.exports.readPost = (req, res) => {
    PostModel.find((err, docs) => {
        if (!err) res.send(docs)
        else console.log('Error to get data :' + err)
    })
}

module.exports.createPost = async (req, res) => {
    const newPost = new PostModel({
        posterId: req.body.posterId,
        message: req.body.message,
        comments: [],
    })
    try {
        const post = await newPost.save()
        return res.status(201).json(post)
    } catch {
        return res.status(400).send(err)
    }
}

module.exports.updatePost = (req, res) => {
    if (!ObjectID.isValid(req.params.id))
        return res.status(400).send("Unknown id : " + req.params.id)

    const updateRecord = {
        message: req.body.message
    }

    PostModel.findByIdAndUpdate(
        req.params.id,
        { $set: updateRecord },
        { new: true },
        (err, docs) => {
            if (!err) res.send(docs)
            else console.log('Update error: ' + err)
        }
    )
}

module.exports.deletePost = (req, res) => {
    if (!ObjectID.isValid(req.params.id))
        return res.status(400).send("id unknown : " + req.params.id)

    PostModel.findByIdAndRemove(
        req.params.id,
        (err, docs) => {
            if (!err) res.send(docs)
            else console.log("delete error :" + err)
        }
    )
}
