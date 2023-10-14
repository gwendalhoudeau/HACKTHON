const mongoose = require('mongoose');

mongoose.set('strictQuery', true)

mongoose.connect('mongodb+srv://' + process.env.DB_USER_PASS + '@hackaton.5bh19ea.mongodb.net/',
{
    //userNewUrlParser: true,
    //useUnifiedTopology:true,
    //useCreateIndex:true,
    //useFindAndModify:false,
    
})
.then(() => console.log('Connected to mongoDB'))
.catch((err) => console.log('Failed to connect to mongoDB',err))
