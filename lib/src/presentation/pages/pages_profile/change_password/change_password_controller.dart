import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/patch_update_pass_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassWordController extends GetxController {
  late TextEditingController oldPasswordEditController;
  late TextEditingController newPasswordEditController;
  late TextEditingController confirmPasswordEditController;
  final RegExp specialCharsRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RxBool showCurrentPassword = false.obs;
  RxBool showNewPassword = false.obs;
  RxBool showConfirmPassword = false.obs;
  late int userId;
  var password = ''.obs;
  var lengthValid = false.obs;
  var uppercaseValid = false.obs;
  var lowercaseValid = false.obs;
  var numericValid = false.obs;
  var specialValid = false.obs;
  final keyForm = GlobalKey<FormState>();
  final UserService _userService = Get.find(tag: Constant.uerSerServiceTAG);
  final NotificationConfig notificationConfig = Get.find();

  @override
  void onInit() {
    userId = Get.arguments['userId'];
    oldPasswordEditController = TextEditingController();
    newPasswordEditController = TextEditingController();
    confirmPasswordEditController = TextEditingController();
    super.onInit();
  }

  void onPasswordChanged(String value) {
    password.value = value;
    lengthValid.value = value.length >= 8;
    uppercaseValid.value = value.contains(RegExp(r'[A-Z]'));
    lowercaseValid.value = value.contains(RegExp(r'[a-z]'));
    numericValid.value = value.contains(RegExp(r'[0-9]'));
    specialValid.value = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  void togglePasswordVisibility(int id) {
    if (id == 1) {
      showCurrentPassword.toggle();
    } else if (id == 2) {
      showNewPassword.toggle();
    } else {
      showConfirmPassword.toggle();
    }
  }

  Future<void> onChange() async {
    if (keyForm.currentState!.validate()) {
      try {
        await _userService.updatePassWord(
          userId: userId,
          body: PatchUpdatePassBody(
            oldPassword: oldPasswordEditController.text.trim(),
            newPassword: newPasswordEditController.text.trim(),
          ),
        );
        Get.back();
        notificationConfig.showSnackBar(
          title: 'Thông báo',
          'Cập nhật mật khẩu Thành Công <3',
          backgroundColor: Get.theme.colorScheme.primary,
        );
      } catch (error) {
        String errorMessage =
            "Mật khẩu cũ hoặc mật khẩu mới không đúng, vui lòng thử lại!";
        notificationConfig.showSnackBar(
          title: 'Thông báo',
          errorMessage,
          backgroundColor: Get.theme.colorScheme.primary,
        );
        Get.log(
          error.toString(),
        );
      }
      _cleanInput();
    }
  }

  void _cleanInput() {
    oldPasswordEditController.text = '';
    newPasswordEditController.text = '';
    confirmPasswordEditController.text = '';
  }
}
