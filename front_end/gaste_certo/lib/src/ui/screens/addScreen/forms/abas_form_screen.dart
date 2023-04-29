import 'package:flutter/material.dart';
import 'package:gaste_certo/src/domain/models/receitas_model.dart';
import 'package:get/get.dart';

import '../../../../business/controllers/receitas_controller.dart';
import '../../../../business/validation/validation_form.dart';
import '../../../../data/repository/receitas_api.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_textfield.dart';

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
  ValidationFunctions validationFunctions = ValidationFunctions();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReceitasController());
    final formKey = GlobalKey<FormState>();
    final receitasApi = Get.lazyPut(() => ReceitasApi());

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              icon: Icons.person,
              label: "Nome da receita",
              textController: controller.nome,
              validator: (value) =>
                  validationFunctions.validateNotEmpty(value!),
            ),
            CustomTextField(
              icon: Icons.person,
              label: "Valor",
              textController: controller.valor,
              validator: (value) =>
                  validationFunctions.validateNotEmpty(value!),
            ),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                  textButton: "Registrar",
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      var valor = controller.valor.text.trim();
                      final ReceitasModel receita = ReceitasModel(
                        nome: controller.nome.text.trim(),
                        valor: double.parse(valor),
                        categoria: '',
                      );

                      ReceitasApi.instance.registerReceitas(
                        receitasModel: receita,
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
