import 'package:flutter/material.dart';
import 'package:gaste_certo/src/domain/models/user_model.dart';
import 'package:get/get.dart';

import '../../../../business/controllers/register_account_controller.dart';
import '../../../../business/validation/validation_form.dart';
import '../../../../data/repository/auth_user.dart';
import '../../../widgets/button_widget.dart';
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

            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                  textButton: "Registrar",
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      final RegisterAccountModel user = RegisterAccountModel(
                        email: controller.email.text.trim(),
                        name: controller.fullName.text.trim(),
                        password: controller.password.text.trim(),
                      );

                      AuthenticationRepository.instance.registerUser(
                        registerModel: user,
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
