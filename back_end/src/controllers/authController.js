const User = require('../models/user');
const AuthService = require('../services/authService');

class AuthController {

    async login(req, res) {
        try {
            const { email, password } = req.body;
            if (!email || !password) {
                res.status(400).json({ message: 'Por favor, informe nome de usuário e senha' });
            }

            const result = await AuthService.signInUser(email, password, res);
            if (!result) {
                res.status(400).json({ message: 'Email ou senha incorreta.' });
            }

            res.json(result);
        } catch (e) {
            res.status(400).json({ error: e.message });
        }
    }

    async register(req, res) {
        try {
            const { email, password, nome } = req.body;
            if (!email || !password || !nome) {
                res.status(400).json({ message: 'Por favor, preencha todos os campos obrigatórios' });
            }

            const userExists = await AuthService.checkIfUserExists(email);
            if (userExists) {
                res.status(400).json({ message: 'Usuário já existe.' })
            }

            const user = await AuthService.signUpUser(req.body);

            if (!user) {
                res.status(400).json({ message: 'Email inválido.' });
            }

            res.status(201).json(user);
        } catch (e) {
            res.status(400).json({ error: e.message });
        }
    }
}

module.exports = new AuthController();