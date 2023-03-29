const bcrypt = require('bcrypt');
const UserRepository = require('../repositories/userRepository')
const validator = require('validator');

class AuthService {
    async signUpUser(user) {

        if (!validator.isEmail(user.email)) {
            return false;
        }

        const hashedPassword = await bcrypt.hash(user.password, 10);
        user.password = hashedPassword;

        return await UserRepository.createUser(user);
    }

    async signInUser(email, password) {
        const user = await UserRepository.findUserByEmail(email);
        if (!user) {
            return false;
        }

        const isCorrectPassword = await bcrypt.compare(password, user.password);
        if (!isCorrectPassword) {
            return false;
        }

        return { user };
    }

    async checkIfUserExists(email) {
        const user = await UserRepository.findUserByEmail(email);
        return user;
    }
}

module.exports = new AuthService();