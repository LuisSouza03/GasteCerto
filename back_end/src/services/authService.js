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
            return false;
        }

        const isCorrectPassword = await bcrypt.compare(password, user.password);
        if (!isCorrectPassword) {
            return false;
        }

        // var privateKey = fs.readFileSync('private.key');
        // const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, { expiresIn: '1d' });
        return { user };
    }
}

module.exports = new AuthService();