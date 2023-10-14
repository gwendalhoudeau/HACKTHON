const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const app = express();
const port = 3000;

// BDD URL
const dbURL = 'mongodb+srv://admin:admin@cluster0.mz50rqi.mongodb.net/';

// User model
const User = require('./models/User');

// Import of the config file and JWT secret key
const config = require('./config');
const jwtSecret = process.env.JWT_SECRET || config.jwtSecret;

// BDD connection
mongoose.connect(dbURL, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((err) => {
    console.error('Connection failed: ', err);
  });


// Middleware to parse the request body into JSON
app.use(express.json());

// Registration endpoint (account creation)
app.post('/signup', async (req, res) => {
  const { username, password, email, role } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);
  
  const user = new User({
    username,
    password: hashedPassword,
    email,
    role,
  });

  try {
    const savedUser = await user.save();
    res.status(201).json({ message: 'User succesfully created' });
  } catch (error) {
    res.status(400).json({ error: 'Registration failed' });
  }
});

// Connection endpoint
app.post('/login', async (req, res) => {
  const { username, password } = req.body;

  try {
    const user = await User.findOne({ username });

    if (!user) {
      res.status(401).json({ error: 'Incorrect username' });
      return;
    }

    const isPasswordValid = await bcrypt.compare(password, user.password);

    if (!isPasswordValid) {
      res.status(401).json({ error: 'Incorrect password' });
      return;
    }

    // Generation of the JWT token
    const token = jwt.sign({ userId: user._id }, jwtSecret);

    res.status(200).json({ token });
  } catch (error) {
    res.status(500).json({ error: 'An error occurred while connecting' });
  }
});

// Server startup
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});