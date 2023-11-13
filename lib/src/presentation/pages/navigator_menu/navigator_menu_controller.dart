import 'package:capstone_project_travel_ease/src/presentation/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatorMenuController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = const [Scaffold(), Scaffold(), ProfilePage()];
  // final screens = const [HomePage(), MyBookingPage(), ProfilePage()];
}
