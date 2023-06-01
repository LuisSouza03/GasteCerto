import 'package:flutter/material.dart';
import 'package:gaste_certo/src/ui/screens/home/home_screen.dart';
import 'package:gaste_certo/src/ui/screens/profileScreen/profile_screen.dart';
import 'package:get/get.dart';

import 'bottom_navigation_bar_controller.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarController bottomNavigationBarController = Get.put(BottomNavigationBarController(), permanent: false);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
              )
            ],
          ),
          child: buildBottomNavigationMenu(context, bottomNavigationBarController),
        ),
        body: Obx(
          () => IndexedStack(
            index: bottomNavigationBarController.tabIndex.value,
            children: const [
              HomeScreen(),
              ProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }

  buildBottomNavigationMenu(context, controller) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            selectedItemColor: Colors.green,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            elevation: 10,
            items: [
              _bottomNavigationBarItem(
                icon: Icons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: Icons.person,
                label: 'Perfil',
              )
            ],
          ),
        ),
      ),
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
