const express = require('express');
const mongoose = require('mongoose');
const routes = require('./routes/authRoutes');

mongoose.connect('mongodb+srv://luis93667:YaorQp5PJFbTSIRs@gastecerto.koxqj2v.mongodb.net/?retryWrites=true&w=majority')
    .then(
        () => {
            console.log('Conectado ao mongoDB')
        },
    )
    .catch((err) => console.log('Erro ao conectar ao server', err));

const app = express();

app.use(express.json());
app.use('/auth', routes);

app.get('/', (req, res) => {
    res.status(200).json({ message: 'API Funcionando' })
})


module.exports = app;

