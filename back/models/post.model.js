const mongoose = require('mongoose')

const PostSchema = new mongoose.Schema(
    {
        posterId: {
            type: String,
            required: true
        },
        location: {
            type: String,
            trim: true,
            maxlength: 500
        },
        quantity:{
            type: Number,
            required: true,
        },
        price: {
            type: Number,
            required: true,
        },
        createdAt: {
            type: Date,
            default: Date.now
          }
    }, { timestamps: true }
)
/*
PostSchema.pre("save", async function (next) {
    const now = new Date();
    if (!this.createdAt) {
        this.createdAt = now;
    }
    next()
})*/

module.exports = mongoose.model('post',PostSchema)