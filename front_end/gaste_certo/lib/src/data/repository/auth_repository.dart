import 'package:flutter/material.dart';

import '../../domain/models/user_model.dart';

abstract class ApiAuthRepository {
  Future<void> registerUser({
    required RegisterAccountModel registerModel,
  });

  Future<void> loginUser({
    required String email,
    required String password,
  });

  Future<void> exceptionFirebaseSnackBar({
    required String message,
    required String title,
    required Color backgroundColor,
  });
}
