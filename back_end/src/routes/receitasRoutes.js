const express = require('express');
const ReceitaController = require('../controllers/receitaController');

const router = express.Router();

router.post('/adicionar', ReceitaController.createReceita);
router.delete('/remover', ReceitaController.deleteReceita);
router.get('/getAll', ReceitaController.getAll);

module.exports = router;
