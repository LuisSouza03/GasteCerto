import 'package:flutter/material.dart';

class DespesasForm extends StatefulWidget {
  const DespesasForm({super.key});

  @override
  _DespesasFormState createState() => _DespesasFormState();
}

class _DespesasFormState extends State<DespesasForm> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  final _valorController = TextEditingController();

  @override
  void dispose() {
    _descricaoController.dispose();
    _valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _descricaoController,
            decoration: const InputDecoration(labelText: 'Nome'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _valorController,
            decoration: const InputDecoration(labelText: 'Valor'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Aqui você pode enviar os dados para a API
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Despesa salva com sucesso!')),
                );
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}

class ReceitasForm extends StatefulWidget {
  const ReceitasForm({super.key});

  @override
  _ReceitasFormState createState() => _ReceitasFormState();
}

class _ReceitasFormState extends State<ReceitasForm> {
  final _formKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  final _valorController = TextEditingController();

  @override
  void dispose() {
    _descricaoController.dispose();
    _valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _descricaoController,
            decoration: const InputDecoration(labelText: 'Nome'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _valorController,
            decoration: const InputDecoration(labelText: 'Valor'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Aqui você pode enviar os dados para a API
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Despesa salva com sucesso!')),
                );
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
