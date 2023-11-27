import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/my_bookmark/my_bookmark_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/login/login_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_notification.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final CheckLoginController checkLoginController = Get.find();
  @override
  void onInit() {
    // checkLoginController.checkLogin();
    super.onInit();
  }

  Future<void> pushLogin() async {
    await Get.toNamed(LoginView.routeName);
    await checkLoginController.checkLogin();
  }

  Future<void> geToBookMark() async {
    if (checkLoginController.isLogin.value == false) {
      Get.dialog(
        DiaLogNotification(
          onTap: () async {
            await Get.toNamed(LoginView.routeName);
            await checkLoginController.checkLogin();
            Get.back();
          },
          title: 'Thông Báo',
          content: 'Đăng nhập để sử dụng chức năng !',
          okText: 'Đăng Nhập',
        ),
      );
    } else {
      Get.toNamed(MyBookMarkPage.routeName);
    }
  }

  Future<void> logOut() async {
    Get.dialog(
      DiaLogNotification(
        onTap: () async {
          await checkLoginController.logOut();
          await Get.offAllNamed(NavigatorMenuPage.routeName);
        },
        title: 'Sign Out',
        content: 'Are you sure you want to sign out?',
        okText: 'Yes, Sign out',
      ),
    );
  }
}
