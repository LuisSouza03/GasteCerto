const express = require('express');
const AuthService = require('../services/authService');

const router = express.Router();

router.post('/cadastrar', async (req, res) => {
    try {
        const user = await AuthService.signUpUser(req.body);
        res.status(201).json(user);
    } catch (e) {
        res.status(400).json({ error: e.message });
    }
})

router.post('/login', async (req, res) => {
    try {
        const { email, senha } = req.body;
        const result = await AuthService.signInUser(email, senha);
        res.json(result);
    } catch (e) {
        res.status(400).json({ error: e.message });
    }
})

module.exports = router;