import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/all_transactions_model.dart';
import '../../utils/utils.dart';

class GetAllTransactions extends GetxController {
  Future<List<AllTransactions>> getAll() async {
    try {
      final responseReceitas = await http.get(
        Uri.parse('http://192.168.0.247:8000/receitas/getAll'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      final responseDespesas = await http.get(
        Uri.parse('http://192.168.0.247:8000/despesas/getAll'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (responseReceitas.statusCode == 201 &&
          responseDespesas.statusCode == 201) {
        var allTransactions = <AllTransactions>[];

        List<dynamic> jsonReceitas = json.decode(responseReceitas.body);
        for (var i = 0; i < jsonReceitas.length; i += 1) {
          jsonReceitas[i]['type'] = 'Receitas';
        }
        List<AllTransactions> receitas =
            jsonReceitas.map((json) => AllTransactions.fromJson(json)).toList();

        List<dynamic> jsonDespesas = json.decode(responseDespesas.body);
        for (var i = 0; i < jsonDespesas.length; i += 1) {
          jsonDespesas[i]['type'] = 'Despesas';
        }
        List<AllTransactions> despesas =
            jsonDespesas.map((json) => AllTransactions.fromJson(json)).toList();

        allTransactions.addAll(receitas);
        allTransactions.addAll(despesas);

        return allTransactions;
      } else {
        Map<String, dynamic> message = jsonDecode(responseReceitas.body);
        var errorMessage = message['message'];

        exceptionFirebaseSnackBar(
          message: errorMessage,
          title: "Receitas",
          backgroundColor: Colors.red,
        );
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<double> getTotal() async {
    double total = 0;

    List<AllTransactions> allTransactions = await getAll();

    for (var transaction in allTransactions) {
      if (transaction.type == 'Receitas') {
        total += transaction.valor!;
      } else if (transaction.type == 'Despesas') {
        total -= transaction.valor!;
      }
    }

    return total;
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
