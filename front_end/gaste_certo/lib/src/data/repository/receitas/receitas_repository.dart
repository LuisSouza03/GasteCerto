import 'package:flutter/material.dart';

import '../../../domain/models/receitas_model.dart';

abstract class ApiReceitasRepository {
  Future<void> registerReceitas({
    required ReceitasModel receitasModel,
  });

  Future<void> deleteReceitas({
    required String id,
  });

  Future<dynamic> getAllReceitas();

  Future<void> exceptionFirebaseSnackBar({
    required String message,
    required String title,
    required Color backgroundColor,
  });
}
