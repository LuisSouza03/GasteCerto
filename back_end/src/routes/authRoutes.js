const express = require('express');
const AuthController = require('../controllers/authController');
const ReceitaController = require('../controllers/receitaController');


const router = express.Router();

router.post('/cadastrar', AuthController.register);
router.post('/login', AuthController.login);
router.post('/adicionar', ReceitaController.createReceita);
router.delete('/remover', ReceitaController.deleteReceita);
router.get('/getAll', ReceitaController.getAll);

module.exports = router;