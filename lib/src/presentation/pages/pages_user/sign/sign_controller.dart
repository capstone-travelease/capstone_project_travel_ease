import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_sign_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:dio/dio.dart';
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
  final RxBool isLoading = false.obs;
  RxBool showPassword = false.obs;
  RxBool showConfirmPassword = false.obs;
  final keyForm = GlobalKey<FormState>();
  final UserService _userService = Get.find(tag: Constant.uerSerServiceTAG);
  final NotificationConfig notificationConfig = Get.find();
  @override
  void onInit() {
    emailEditController = TextEditingController();
    passwordEditController = TextEditingController();
    nameEditController = TextEditingController();
    phoneEditController = TextEditingController();
    confirmPasswordEditController = TextEditingController();
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
    isLoading.call(true);
    if (keyForm.currentState!.validate()) {
      try {
        await _userService.signUser(
          body: PostSignBody(
            email: emailEditController.text.trim(),
            password: passwordEditController.text.trim(),
            phone: int.parse(phoneEditController.text.trim()),
            name: nameEditController.text.trim(),
          ),
        );
        _cleanInput();
        Get.back();
        notificationConfig.showSnackBar(
          title: 'Thông báo',
          'Đăng Kí Tài Khoản Thành Công <3',
          backgroundColor: Get.theme.colorScheme.primary,
        );
      } catch (error) {
        String errorMessage = "Có lỗi xảy ra, thử lại nhé!";
        if (error is DioException) {
          if (error.response?.statusCode == 409 &&
              error.response?.data['message'] != null) {
            errorMessage = error.response?.data['message'] ??
                "Có lỗi xảy ra, thử lại nhé!";
          }
        }
        notificationConfig.showSnackBar(
          title: 'Thông báo',
          errorMessage,
          backgroundColor: Get.theme.colorScheme.primary,
        );
        Get.log(
          error.toString(),
        );
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
