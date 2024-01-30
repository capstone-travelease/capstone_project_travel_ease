import 'package:capstone_project_travel_ease/src/presentation/pages/help/help_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/home/home_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/profile/profile_page.dart';
import 'package:get/get.dart';

class NavigatorMenuController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = const [
    HomePage(),
    MyBookingPage(),
    HelpPage(),
    ProfilePage(),
  ];
}
