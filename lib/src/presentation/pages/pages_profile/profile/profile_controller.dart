import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/src/domain/models/user_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/my_bookmark/my_bookmark_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/login/login_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_notification.dart';
import 'package:get/get.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class ProfileController extends GetxController {
  final CheckLoginController checkLoginController = Get.find();
  final UserService _userService = Get.find(tag: Constant.uerSerServiceTAG);
  final Rxn<UserModel> user = Rxn<UserModel>();
  final RxBool isLoading = false.obs;
  int userId = 0;
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  Future<void> loadData() async {
    final prefs = await SecureSharedPref.getInstance();
    userId = await prefs.getInt(Constant.userId) ?? -1;
    fetchUser(userId: userId);
  }

  Future<void> fetchUser({required int userId}) async {
    try {
      final res = await _userService.getUser(userId: userId);
      user.call(res);
    } catch (e) {
      Get.log(e.toString());
    }
    isLoading.call(false);
  }

  Future<void> pushLogin() async {
    String previousRoute = Get.currentRoute;
    await Get.toNamed(LoginView.routeName);
    await checkLoginController.checkLogin();
    Get.offNamedUntil(previousRoute, (route) => false);
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
