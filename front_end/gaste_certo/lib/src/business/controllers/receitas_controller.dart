import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReceitasController extends GetxController {
  static ReceitasController get instance => Get.find();

  final nome = TextEditingController();
  final categoria = TextEditingController();
  final valor = TextEditingController();
}
