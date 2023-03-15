const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const UserRepository = require('../repositories/userRepository');

class AuthService {
    async signUpUser(user) {
        const hashedPassword = await bcrypt.hash(user.password, 10);
        user.password = hashedPassword;
        return await UserRepository.createUser(user);
    }

    async signInUser(email, password) {
        const user = await UserRepository.findUserByEmail(email);
        if (!user) {
            throw new Error('Usuário não encontrado.');
        }

        const correctPassword = await bcrypt.compare(password, user.password);
        if (!correctPassword) {
            // Colocamos email ou senha, pois caso não seja a pessoa tentando acessar esta conta
            // Ficara mais dificil para saber se é o email ou senha inválidos. 
            throw new Error('Email ou senha incorreta.')
        }

        const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, { expiresIn: '1d' });
        return { user, token };
    }
}

module.exports = new AuthService();