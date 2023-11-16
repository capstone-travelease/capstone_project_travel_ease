import 'package:capstone_project_travel_ease/src/presentation/loading/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/home/home_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/mybooking/mybooking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/profile/profile_page.dart';
import 'package:get/get.dart';

class NavigatorMenuController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final CheckLoginController checkLoginController = Get.find();

  final screens = const [HomePage(), MyBookingPage(), ProfilePage()];

  @override
  void onInit() {
    checkLoginController.checkLogin();
    // fullname == checkLoginController.fullName.value;
    super.onInit();
  }
}
