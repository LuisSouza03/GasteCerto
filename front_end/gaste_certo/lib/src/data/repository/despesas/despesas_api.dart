import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../domain/models/despesas_model.dart';
import '../../../utils/utils.dart';
import 'despesas_repository.dart';

class DespesasApi extends GetxController implements ApiDespesasRepository {
  static DespesasApi get instance => Get.find();

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
  Future<void> deleteDespesas({required String id}) async {
    try {
      final Map<String, dynamic> data = {
        "id": id,
      };

      final response = await http.delete(
        Uri.parse('http://192.168.0.247:8000/despesas/adicionar'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        var message = 'Receita deletada com sucesso';

        exceptionFirebaseSnackBar(
          message: message,
          title: "Despesas",
          backgroundColor: Colors.green,
        );
      } else {
        Map<String, dynamic> message = jsonDecode(response.body);
        var errorMessage = message['message'];

        exceptionFirebaseSnackBar(
          message: errorMessage,
          title: "Despesas",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {}
  }

  @override
  Future<dynamic> getAllDespesas() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.0.247:8000/despesas/adicionar'),
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
          title: "Despesas",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {}
  }

  @override
  Future<void> registerDespesas({required DespesasModel despesasModel}) async {
    try {
      final Map<String, dynamic> data = {
        "nome": despesasModel.nome,
        "categoria": despesasModel.categoria,
        "valor": despesasModel.valor,
      };

      final response = await http.post(
        Uri.parse('http://192.168.0.247:8000/despesas/adicionar'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        var message = 'Receita criada com sucesso';

        exceptionFirebaseSnackBar(
          message: message,
          title: "Despesas",
          backgroundColor: Colors.green,
        );
        Get.back();
      } else {
        Map<String, dynamic> message = jsonDecode(response.body);
        var errorMessage = message['message'];

        exceptionFirebaseSnackBar(
          message: errorMessage,
          title: "Despesas",
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {}
  }
}
