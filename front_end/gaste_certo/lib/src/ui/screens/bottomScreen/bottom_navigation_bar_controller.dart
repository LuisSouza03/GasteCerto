import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  var tabIndex = 0.obs;

  changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
