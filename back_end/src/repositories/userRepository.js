const User = require('../models/user');

class UserRepository {
    async createUser(user) {
        return await User.create(user);
    }

    async findUserByEmail(email) {
        return await User.findOne({ email });
    }
}

module.exports = new UserRepository();