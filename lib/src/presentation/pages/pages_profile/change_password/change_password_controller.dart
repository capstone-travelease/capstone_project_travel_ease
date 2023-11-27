import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassWordController extends GetxController {
  late TextEditingController currentPasswordEditController;
  late TextEditingController newPasswordEditController;
  late TextEditingController confirmPasswordEditController;
  final RegExp specialCharsRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RxBool showCurrentPassword = false.obs;
  RxBool showNewPassword = false.obs;
  RxBool showConfirmPassword = false.obs;

  var password = ''.obs;
  var lengthValid = false.obs;
  var uppercaseValid = false.obs;
  var lowercaseValid = false.obs;
  var numericValid = false.obs;
  var specialValid = false.obs;
  final keyForm = GlobalKey<FormState>();
  @override
  void onInit() {
    currentPasswordEditController = TextEditingController();
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
      _cleanInput();
    }
  }

  void _cleanInput() {
    currentPasswordEditController.text = '';
    newPasswordEditController.text = '';
    confirmPasswordEditController.text = '';
  }
}
