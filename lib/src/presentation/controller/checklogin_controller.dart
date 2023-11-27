import 'package:capstone_project_travel_ease/core/constrants/localvariable.dart';
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
    isLogin.value = prefs.getBool(LocalVariable.isLogin) ?? false;
    fullName.value = prefs.getString(LocalVariable.fullName) ?? '';
    userid.value = prefs.getInt(LocalVariable.userId) ?? -1;
  }

  Future<void> login(String fullName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(LocalVariable.fullName, fullName);
    await prefs.setBool(LocalVariable.isLogin, true);
  }

  Future<void> logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LocalVariable.isLogin, false);
    await prefs.setString(LocalVariable.fullName, '');
  }
}
