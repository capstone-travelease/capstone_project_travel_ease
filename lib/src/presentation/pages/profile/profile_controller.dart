import 'package:capstone_project_travel_ease/core/constrants/localvariable.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/login/login_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_sign_out.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  Future<void> logOut() async {
    Get.dialog(
      DiaLogSignOut(
        onTap: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool(LocalVariable.isLogin, false);
          Get.offAllNamed(LoginView.routeName);
        },
      ),
    );
  }
}
