import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gaste_certo/src/data/repository/receitas_repository.dart';
import 'package:gaste_certo/src/domain/models/receitas_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/utils.dart';

class ReceitasApi extends GetxController implements ApiReceitasRepository {
  static ReceitasApi get instance => Get.find();

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

  @override
  Future<void> deleteReceitas({required String id}) async {
    try {
      final Map<String, dynamic> data = {
        "id": id,
      };

      final response = await http.delete(
        Uri.parse('http://192.168.0.247:8000/receitas/adicionar'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        var message = 'Receita deletada com sucesso';

        exceptionFirebaseSnackBar(
          message: message,
          title: "Receitas",
          backgroundColor: Colors.green,
        );
      } else {
        Map<String, dynamic> message = jsonDecode(response.body);
        var errorMessage = message['message'];

        exceptionFirebaseSnackBar(
          message: errorMessage,
          title: "Receitas",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {}
  }

  @override
  Future<dynamic> getAllReceitas() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.0.247:8000/receitas/adicionar'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        return response.body;
      } else {
        Map<String, dynamic> message = jsonDecode(response.body);
        var errorMessage = message['message'];

        exceptionFirebaseSnackBar(
          message: errorMessage,
          title: "Receitas",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {}
  }

  @override
  Future<void> registerReceitas({required ReceitasModel receitasModel}) async {
    try {
      final Map<String, dynamic> data = {
        "nome": receitasModel.nome,
        "categoria": receitasModel.categoria,
        "valor": receitasModel.valor,
      };

      final response = await http.post(
        Uri.parse('http://192.168.0.247:8000/receitas/adicionar'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        var message = 'Receita criada com sucesso';

        exceptionFirebaseSnackBar(
          message: message,
          title: "Receitas",
          backgroundColor: Colors.green,
        );
      } else {
        Map<String, dynamic> message = jsonDecode(response.body);
        var errorMessage = message['message'];

        exceptionFirebaseSnackBar(
          message: errorMessage,
          title: "Receitas",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {}
  }
}
