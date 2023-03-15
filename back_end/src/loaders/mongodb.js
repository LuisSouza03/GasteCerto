const mongoose = require('mongoose');

async function startDB() {
    await mongoose.connect('mongodb+srv://luis93667:YaorQp5PJFbTSIRs@gastecerto.koxqj2v.mongodb.net/test');
}