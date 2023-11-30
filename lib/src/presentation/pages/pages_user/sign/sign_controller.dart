import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_sign_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignController extends GetxController {
  late TextEditingController nameEditController;
  late TextEditingController phoneEditController;
  late TextEditingController emailEditController;
  late TextEditingController passwordEditController;
  late TextEditingController confirmPasswordEditController;
  final RegExp phoneRegex = RegExp(r'^([1-9])?\d{10}$');
  final RegExp specialCharsRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  bool isChecked = false;
  final RxBool isLoading = true.obs;
  RxBool showPassword = false.obs;
  RxBool showConfirmPassword = false.obs;
  final keyForm = GlobalKey<FormState>();
  final UserService _userService = Get.find(tag: Constant.uerSerServiceTAG);
  final NotificationConfig notificationConfig = Get.find();
  @override
  void onInit() {
    emailEditController = TextEditingController(text: 'anh@gmail.com');
    passwordEditController = TextEditingController(text: 'Anh123456@');
    nameEditController = TextEditingController(text: 'anh');
    phoneEditController = TextEditingController(text: '0987654321');
    confirmPasswordEditController = TextEditingController(text: 'Anh123456@');
    super.onInit();
  }

  void togglePasswordVisibility(int id) {
    if (id == 1) {
      showPassword.toggle();
    } else {
      showConfirmPassword.toggle();
    }
  }

  Future<void> onSend() async {
    if (keyForm.currentState!.validate()) {
      try {
        final res = await _userService.signUser(
          body: PostSignBody(
            email: emailEditController.text.trim(),
            password: passwordEditController.text.trim(),
            phone: int.parse(phoneEditController.text.trim()),
            name: nameEditController.text.trim(),
          ),
        );
        if (res != null) {
          Get.back();
          notificationConfig.showSnackBar(
              title: 'Thông báo',
              'Đăng Kí Tài Khoản Thành Công <3',
              backgroundColor: Get.theme.colorScheme.primary);
          // Get.offAllNamed(LoginView.routeName);
          _cleanInput();
        }
      } catch (error) {
        // if (Get.isSnackbarOpen) Get.closeAllSnackbars();
        // SnackBarAndLoading.showSnackBar(
        //   'Kết nối internet thất bại',
        //   backgroundColor: Get.theme.colorScheme.error,
        // );

        Get.log(error.toString());
      }
    }
    isLoading.call(false);
  }

  void _cleanInput() {
    nameEditController.text = '';
    phoneEditController.text = '';
    confirmPasswordEditController.text = '';
    emailEditController.text = '';
    passwordEditController.text = '';
  }
}
