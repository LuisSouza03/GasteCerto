import 'dart:convert';

import 'package:gaste_certo/src/data/repository/auth_repository.dart';
import 'package:gaste_certo/src/domain/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants/constants.dart';

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
        'nome': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse('http://192.168.0.247:8000/auth/login'),
        body: jsonEncode(data), // converter o Map em JSON
        headers: {
          'Content-Type': 'application/json', // definir o tipo de conteúdo
        },
      );

      if (response.statusCode == 200) {
        var x = response.body;
      } else {
        var message = response.body;
      }
    } catch (e) {
      throw UnimplementedError();
    }
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
}
