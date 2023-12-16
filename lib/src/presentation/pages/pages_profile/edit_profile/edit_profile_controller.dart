import 'dart:io';

import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/put_update_user_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  late TextEditingController nameEditController;
  late TextEditingController phoneEditController;
  late TextEditingController emailEditController;
  late TextEditingController genDerEditController;
  late TextEditingController birthDayEditController;
  final UserService _userService = Get.find(tag: Constant.uerSerServiceTAG);
  Rx<File> image = Rx(File(''));
  final keyForm = GlobalKey<FormState>();
  late int userId;
  final NotificationConfig notificationConfig = Get.find();
  @override
  void onInit() {
    userId = Get.arguments['userId'];
    emailEditController = TextEditingController(text: 'anh@gmail.com');
    nameEditController = TextEditingController(text: 'anh');
    phoneEditController = TextEditingController(text: '0987654321');
    genDerEditController = TextEditingController();
    birthDayEditController = TextEditingController();
    super.onInit();
  }

  Future updateUser() async {
    if (keyForm.currentState!.validate()) {
      try {
        await _userService.updateUser(
            userId: userId,
            body: PutUpdateUserBody(
              phone: phoneEditController.text.trim(),
              fullname: nameEditController.text.trim(),
              gender: true,
              avatar: '',
              birthday: '09/01/2002',
            ));
        Get.back();
        notificationConfig.showSnackBar(
            title: 'Thông báo',
            'Cập nhật thông tin Thành Công <3',
            backgroundColor: Get.theme.colorScheme.primary);
      } catch (error) {
        String errorMessage = "Có lỗi xảy ra, vui lòng thử lại nhé!";
        notificationConfig.showSnackBar(
            title: 'Thông báo',
            errorMessage,
            backgroundColor: Get.theme.colorScheme.primary);
        Get.log(error.toString());
      }
    }
    _cleanInput();
  }

  Future getGallery() async {
    ImagePicker picker = ImagePicker();
    final XFile? imageUser =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageUser != null) {
      image.value = File(imageUser.path);
    } else {
      print('No image selected.');
    }
  }

  void _cleanInput() {
    emailEditController.text = '';
    nameEditController.text = '';
    phoneEditController.text = '';
    genDerEditController.text = '';
    birthDayEditController.text = '';
  }
}
