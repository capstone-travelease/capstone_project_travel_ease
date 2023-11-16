import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NavigatorMenuPage extends GetView<NavigatorMenuController> {
  static const String routeName = '/NavigatorMenuPage';
  const NavigatorMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 0,
          onTap: (index) => controller.selectedIndex.value = index,
          currentIndex: controller.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Iconsax.home_1_copy), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_sharp), label: 'Booking'),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.user_octagon_copy), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
