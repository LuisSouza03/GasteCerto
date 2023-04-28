const mongoose = require('mongoose');

const despesaSchema = new mongoose.Schema({
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

module.exports = mongoose.model('Despesa', despesaSchema);