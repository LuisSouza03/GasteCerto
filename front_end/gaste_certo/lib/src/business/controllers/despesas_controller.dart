import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DespesasController extends GetxController {
  static DespesasController get instance => Get.find();

  final nome = TextEditingController();
  final categoria = TextEditingController();
  final valor = TextEditingController();
}
