const Receita = require("../models/receita");

class ReceitaController {

    async createReceita(req, res) {
        try {
            const { nome, categoria, valor } = req.body;

            const receita = new Receita({
                nome,
                categoria,
                valor,
            });
            await receita.save()
            res.status(201).json(receita);
        } catch (err) {
            console.log(err);
            res.status(500).json({ messagem: 'Ocorreu um erro ao criar a receita' })
        }
    }

    async deleteReceita(req, res) {
        try {
            const receita = await Receita.findByIdAndRemove(req.body.id);

            if (!receita) {
                return res.status(404).json({ error: 'Receita não encontrada.' });
            }

            return res.json(receita);
        } catch (error) {
            return res.status(500).json({ error: 'Erro ao remover receita.' });
        }
    }

    async getAll(req, res) {
        try {
            const receitas = await Receita.find();
            return res.status(201).json(receitas);
        } catch (error) {
            debugger
            return res.status(500).json({ error: 'Erro ao buscar receitas.' });
        }
    }

}


module.exports = new ReceitaController();