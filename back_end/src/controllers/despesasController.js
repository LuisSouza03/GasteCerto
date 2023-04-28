const Despesas = require("../models/despesa");

class DespesasController {

    async createDespesa(req, res) {
        try {
            const { nome, categoria, valor } = req.body;

            const despesas = new Despesas({
                nome,
                categoria,
                valor,
            });
            await despesas.save()
            res.status(201).json(despesas);
        } catch (err) {
            console.log(err);
            res.status(500).json({ messagem: 'Ocorreu um erro ao criar a despesas' })
        }
    }

    async deleteDespesas(req, res) {
        try {
            const despesas = await Despesas.findByIdAndRemove(req.body.id);

            if (!despesas) {
                return res.status(404).json({ error: 'Despesas não encontrada.' });
            }

            return res.json(despesas);
        } catch (error) {
            return res.status(500).json({ error: 'Erro ao remover despesas.' });
        }
    }

    async getAll(req, res) {
        try {
            const despesas = await Despesas.find();
            return res.status(201).json(despesas);
        } catch (error) {
            debugger
            return res.status(500).json({ error: 'Erro ao buscar despesas.' });
        }
    }

}


module.exports = new DespesasController();