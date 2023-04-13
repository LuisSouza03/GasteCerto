import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaste_certo/src/data/repository/auth_repository.dart';
import 'package:gaste_certo/src/domain/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../ui/screens/home/home_screen.dart';
import '../../utils/constants/constants.dart';
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
      var url = Uri.parse('${ApiConstants.baseUrlAuthApi}login').replace(
        queryParameters: {
          'nome': registerModel.name,
          'email': registerModel.email,
          'password': registerModel.password
        },
      );

      var response = await http.get(url);
      if (response.statusCode == 200) {}
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
