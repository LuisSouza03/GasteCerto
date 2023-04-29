import 'package:flutter/material.dart';

import '../../../domain/models/despesas_model.dart';

abstract class ApiDespesasRepository {
  Future<void> registerDespesas({
    required DespesasModel despesasModel,
  });

  Future<void> deleteDespesas({
    required String id,
  });

  Future<dynamic> getAllDespesas();

  Future<void> exceptionFirebaseSnackBar({
    required String message,
    required String title,
    required Color backgroundColor,
  });
}
