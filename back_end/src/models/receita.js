const mongoose = require('mongoose');

const receitaSchema = new mongoose.Schema({
    nome: {
        type: String,
        required: true,
    },
    categoria: {
        type: String
    },
    valor: {
        type: Number,
        required: true,
    },
    data: {
        type: Date,
        default: Date.now,
    },
})

module.exports = mongoose.model('Receita', receitaSchema);