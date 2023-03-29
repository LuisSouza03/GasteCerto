import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../business/controllers/register_account_controller.dart';
import '../../../../business/validation/validation_form.dart';
import '../../../widgets/custom_textfield.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isSelectedEstado = false;

  ValidationFunctions validationFunctions = ValidationFunctions();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterAccountController());
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
          children: [
            // Full name
            CustomTextField(
              icon: Icons.person,
              label: "Nome completo",
              textController: controller.fullName,
              validator: (value) =>
                  validationFunctions.validateNotEmpty(value!),
            ),
            // Email
            CustomTextField(
              icon: Icons.email,
              label: "Email",
              textController: controller.email,
              validator: (value) => validationFunctions.validateEmail(value!),
            ),
            // Enter Password
            CustomTextField(
              icon: Icons.password,
              label: "Senha",
              isSecret: true,
              textController: controller.password,
              validator: (value) =>
                  validationFunctions.validatePassword(value!, controller),
            ),
          ],
        ),
      ),
    );
  }
}
