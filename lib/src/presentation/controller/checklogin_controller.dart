import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckLoginController extends GetxController {
  RxBool isLogin = false.obs;
  RxString fullName = ''.obs;
  RxInt userid = 0.obs;
  @override
  void onInit() {
    checkLogin();
    super.onInit();
  }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    isLogin.value = prefs.getBool(Constant.isLogin) ?? false;

    userid.value = prefs.getInt(Constant.userId) ?? -1;
  }

  Future<void> login(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(Constant.userId, userId);
    await prefs.setBool(Constant.isLogin, true);
  }

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Constant.isLogin, false);
    await prefs.setInt(Constant.userId, -1);
  }
}
