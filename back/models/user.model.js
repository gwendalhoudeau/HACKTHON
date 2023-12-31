const mongoose = require('mongoose')
const bcrypt = require('bcrypt')
const { isEmail } = require('validator')
const userSchema = new mongoose.Schema(
    {
        pseudo: {
            type: String,
            require: true,
            minLength: 3,
            maxLength: 50,
            unique: true,
            trimp: true
        },
        email: {
            type: String,
            require: true,
            validate: [isEmail],
            lowercase: true,
            trim: true,
            unique: true
        },
        password: {
            type: String,
            require: true,
            max: 1024,
            minLength: 6
        }
    }, { timestamps: true }
)

userSchema.pre("save", async function (next) {
    const salt = await bcrypt.genSalt()
    this.password = await bcrypt.hash(this.password, salt)
    const now = new Date();
    if (!this.createdAt) {
        this.createdAt = now;
    }
    next()
})

userSchema.statics.login = async function (email, password) {
    const user = await this.findOne({ email })
    if (user) {
        const auth = await bcrypt.compare(password, user.password)
        if (auth) {
            return user
        }
        throw Error('Incorrect password')
    }
    throw Error('Incorrect email')
}

const UserModel = mongoose.model('User', userSchema)

module.exports = UserModel