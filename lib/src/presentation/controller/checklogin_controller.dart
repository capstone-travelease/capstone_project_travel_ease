import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/src/domain/models/user_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/login/login_page.dart';
import 'package:get/get.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

class CheckLoginController extends GetxController {
  RxBool isLogin = false.obs;
  RxString token = ''.obs;
  RxInt userid = 0.obs;
  final UserService _userService = Get.find(tag: Constant.uerSerServiceTAG);
  final Rxn<UserModel> user = Rxn<UserModel>();
  @override
  void onInit() {
    checkLogin();
    super.onInit();
  }

  Future<void> fetchUser() async {
    try {
      final res = await _userService.getUser(userId: userid.value);
      user.call(res);
    } catch (e) {
      Get.log(e.toString());
    }
  }

  Future<void> pushLogin() async {
    await Get.toNamed(LoginView.routeName);
    await checkLogin();
    fetchUser();
  }

  Future<void> checkLogin() async {
    final prefs = await SecureSharedPref.getInstance();
    isLogin.value = await prefs.getBool(Constant.isLogin) ?? false;
    token.value = await prefs.getString(Constant.token) ?? '';
    userid.value = await prefs.getInt(Constant.userId) ?? -1;
    await fetchUser();
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
    await checkLogin();
    user.value = null;
  }
}
