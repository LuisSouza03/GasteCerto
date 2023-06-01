const User = require('../models/user');
const AuthService = require('../services/authService');

class AuthController {

    async login(req, res) {
        debugger
        try {
            const { email, password } = req.body;
            if (!email || !password) {
                return res.status(400).json({ message: 'Por favor, informe nome de usuário e senha' });
            }

            const result = await AuthService.signInUser(email, password, res);
            if (!result) {
                return res.status(400).json({ message: 'Email ou senha incorreta.' });
            }

            res.status(201).json(result);
        } catch (e) {
            res.status(400).json({ error: e.message });
        }
    }

    async register(req, res) {
        try {
            const { email, password, nome } = req.body;
            if (!email || !password || !nome) {
                return res.status(400).json({ message: 'Por favor, preencha todos os campos obrigatórios' });
            }

            const userExists = await AuthService.checkIfUserExists(email);
            if (userExists) {
                return res.status(400).json({ message: 'Usuário já existe.' })
            }


            const user = await AuthService.signUpUser(req.body);

            if (!user) {
                return res.status(400).json({ message: 'Email inválido.' });
            }

            res.status(201).json(user);
        } catch (e) {
            res.status(400).json({ error: e.message });
        }
    }
}

module.exports = new AuthController();