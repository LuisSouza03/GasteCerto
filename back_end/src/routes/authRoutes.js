const express = require('express');
const AuthService = require('../services/authService');


const router = express.Router();

router.post('/cadastrar', async (req, res) => {
    try {
        const { email, password, nome } = req.body;
        if (!email || !password || !nome) {
            res.status(400).json({ message: 'Por favor, preencha todos os campos obrigatórios' });
        }

        const user = await AuthService.signUpUser(req.body);
        res.status(201).json(user);
    } catch (e) {
        res.status(400).json({ error: e.message });
    }
})

router.post('/login', async (req, res) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            res.status(400).json({ message: 'Por favor, informe nome de usuário e senha' });
        }

        const result = await AuthService.signInUser(email, password, res);
        if (!result) {
            res.status(400).json({ message: 'Email ou senha incorreta.' });
        } else {
            res.json(result);
        }
    } catch (e) {
        res.status(400).json({ error: e.message });
    }
})

module.exports = router;