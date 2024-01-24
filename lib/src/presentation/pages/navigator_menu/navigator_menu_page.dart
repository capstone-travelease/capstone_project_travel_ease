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
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          selectedIndex: controller.selectedIndex.value,
          indicatorColor: Colors.red[100],
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home_1_copy),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.list_alt_sharp),
              label: 'Booking',
            ),
            NavigationDestination(
              icon: Icon(Icons.help_outline),
              label: 'Help',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user_octagon_copy),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
