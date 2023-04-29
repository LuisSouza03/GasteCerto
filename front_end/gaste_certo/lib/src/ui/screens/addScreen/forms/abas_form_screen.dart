import 'package:flutter/material.dart';
import 'package:gaste_certo/src/domain/models/receitas_model.dart';
import 'package:get/get.dart';

import '../../../../business/controllers/despesas_controller.dart';
import '../../../../business/controllers/receitas_controller.dart';
import '../../../../business/validation/validation_form.dart';
import '../../../../data/repository/despesas/despesas_api.dart';
import '../../../../data/repository/receitas/receitas_api.dart';
import '../../../../domain/models/despesas_model.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_textfield.dart';

class DespesasForm extends StatefulWidget {
  const DespesasForm({super.key});

  @override
  _DespesasFormState createState() => _DespesasFormState();
}

class _DespesasFormState extends State<DespesasForm> {
  ValidationFunctions validationFunctions = ValidationFunctions();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DespesasController());
    final formKey = GlobalKey<FormState>();
    Get.lazyPut(() => DespesasApi());

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
                      final DespesasModel despesa = DespesasModel(
                        nome: controller.nome.text.trim(),
                        valor: double.parse(valor),
                        categoria: '',
                      );

                      DespesasApi.instance.registerDespesas(
                        despesasModel: despesa,
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
