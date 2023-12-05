import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:get/get.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

class CheckLoginController extends GetxController {
  RxBool isLogin = false.obs;
  RxString token = ''.obs;
  RxInt userid = 0.obs;
  @override
  void onInit() {
    checkLogin();
    super.onInit();
  }

  Future<void> checkLogin() async {
    final prefs = await SecureSharedPref.getInstance();
    isLogin.value = await prefs.getBool(Constant.isLogin) ?? false;
    token.value = await prefs.getString(Constant.token) ?? '';
    userid.value = await prefs.getInt(Constant.userId) ?? -1;
  }

  Future<void> login({required int userId, required String token}) async {
    final prefs = await SecureSharedPref.getInstance();
    await prefs.putInt(Constant.userId, userId);
    await prefs.putString(Constant.token, token);
    await prefs.putBool(Constant.isLogin, true);
  }

  Future<void> logOut() async {
    final prefs = await SecureSharedPref.getInstance();
    await prefs.putBool(Constant.isLogin, false);
    await prefs.putInt(Constant.userId, -1);
    await prefs.putString(Constant.token, '');
  }
}
