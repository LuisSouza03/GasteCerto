import 'package:email_validator/email_validator.dart';

import '../controllers/register_account_controller.dart';

class ValidationFunctions {
  String? validateNotEmpty(String value) {
    return value.isEmpty ? "Esse campo é obrigatório" : null;
  }

  String? validatePassword(String value, RegisterAccountController controller) {
    if (value.isEmpty) {
      return "Esse campo é obrigatório";
    }
    return null;
  }

  String? validatePasswordAgain(
      String value, RegisterAccountController controller) {
    if (value.isEmpty) {
      return "Esse campo é obrigatório";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Esse campo é obrigatório";
    } else {
      final bool isValid = EmailValidator.validate(value);
      if (!isValid) {
        return "Email não é válido";
      }
    }
    return null;
  }
}
