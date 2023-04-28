const express = require('express');
const AuthController = require('../controllers/authController');


const router = express.Router();

// Login
router.post('/cadastrar', AuthController.register);
router.post('/login', AuthController.login);

module.exports = router;