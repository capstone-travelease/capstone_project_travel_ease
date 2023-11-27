import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  late TextEditingController nameEditController;
  late TextEditingController phoneEditController;
  late TextEditingController emailEditController;
  late TextEditingController genDerEditController;
  late TextEditingController birthDayEditController;

  @override
  void onInit() {
    emailEditController = TextEditingController(text: 'anh@gmail.com');
    nameEditController = TextEditingController(text: 'anh');
    phoneEditController = TextEditingController(text: '0987654321');
    genDerEditController = TextEditingController();
    birthDayEditController = TextEditingController();
    super.onInit();
  }
}
