import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterAccountController extends GetxController {
  static RegisterAccountController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
}
