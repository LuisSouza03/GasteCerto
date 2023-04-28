const express = require('express');
const DespesasController = require('../controllers/despesasController');

const router = express.Router();

router.post('/adicionar', DespesasController.createDespesa);
router.delete('/remover', DespesasController.deleteDespesas);
router.get('/getAll', DespesasController.getAll);

module.exports = router;
