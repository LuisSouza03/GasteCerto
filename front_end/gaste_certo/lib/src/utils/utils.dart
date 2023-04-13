import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  showSnackBar({
    required String title,
    required String message,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Get.snackbar(
      title,
      message,
      icon: Icon(
        icon,
        color: iconColor,
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      duration: const Duration(seconds: 5),
    );
  }
}
