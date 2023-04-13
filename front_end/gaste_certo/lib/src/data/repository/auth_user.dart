import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaste_certo/src/data/repository/auth_repository.dart';
import 'package:gaste_certo/src/domain/models/user_model.dart';
import 'package:gaste_certo/src/ui/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../ui/screens/home/home_screen.dart';
import '../../utils/utils.dart';

class AuthenticationRepository extends GetxController
    implements ApiAuthRepository {
  static AuthenticationRepository get instance => Get.find();
  @override
  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, String> data = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse('http://192.168.0.247:8000/auth/login'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        Get.offAll(() => const HomeScreen());
      } else {
        Map<String, dynamic> message = jsonDecode(response.body);
        var errorMessage = message['message'];

        exceptionFirebaseSnackBar(
          message: errorMessage,
          title: "Login",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {}
  }

  @override
  Future<void> registerUser({
    required RegisterAccountModel registerModel,
  }) async {
    try {
      final Map<String, String> data = {
        "nome": registerModel.name,
        "email": registerModel.email,
        "password": registerModel.password
      };

      final response = await http.post(
        Uri.parse('http://192.168.0.247:8000/auth/cadastrar'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        Get.to(() => const LoginAccountScreen());

        exceptionFirebaseSnackBar(
          message: "Registro feito com suceesso, logue com sua conta.",
          title: "Login",
          backgroundColor: Colors.green,
        );
      }
    } catch (e) {}
    throw UnimplementedError();
  }

  @override
  Future<void> exceptionFirebaseSnackBar(
      {required String message,
      required String title,
      required Color backgroundColor}) async {
    Utils().showSnackBar(
      title: title,
      message: message,
      icon: Icons.error_outline_outlined,
      iconColor: Colors.white,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
    );
  }
}
