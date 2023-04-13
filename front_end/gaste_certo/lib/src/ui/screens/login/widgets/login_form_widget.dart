import 'package:flutter/material.dart';
import 'package:gaste_certo/src/ui/screens/register/register_screen.dart';
import 'package:get/get.dart';

import '../../../../business/controllers/register_account_controller.dart';
import '../../../../business/validation/validation_form.dart';
import '../../../../data/repository/auth_user.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_textfield.dart';

class LoginAccountForm extends StatelessWidget {
  const LoginAccountForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(RegisterAccountController());
    ValidationFunctions validationFunctions = ValidationFunctions();
    AuthenticationRepository authenticationRepository =
        Get.put(AuthenticationRepository());

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          children: [
            CustomTextField(
              icon: Icons.email,
              label: "Email",
              textController: controller.email,
              validator: (value) => validationFunctions.validateEmail(value!),
            ),
            CustomTextField(
              icon: Icons.password_outlined,
              label: "Senha",
              isSecret: true,
              textController: controller.password,
              validator: (value) =>
                  validationFunctions.validateNotEmpty(value!),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Esqueceu a senha?",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget(
                textButton: "Login",
                onPress: () {
                  if (formKey.currentState!.validate()) {
                    AuthenticationRepository.instance.loginUser(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                    );
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => Get.to(() => const RegisterAccountScreen()),
                child: const Text(
                  "Registre-se aqui",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
