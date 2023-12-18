import 'dart:io';

import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/domain/models/user_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/put_update_user_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  late TextEditingController nameEditController;
  late TextEditingController phoneEditController;
  late TextEditingController genDerEditController;
  final UserService _userService = Get.find(tag: Constant.uerSerServiceTAG);
  Rx<File> image = Rx(File(''));
  final keyForm = GlobalKey<FormState>();
  late UserModel userModel;
  final Rxn<DateTime>? birthday = Rxn();
  final Rxn<bool>? genDer = Rxn();
  final NotificationConfig notificationConfig = Get.find();
  @override
  void onInit() {
    userModel = Get.arguments['userModel'];
    birthday?.value = userModel.dob;
    genDer?.value = userModel.gender;
    nameEditController = TextEditingController(text: userModel.full_name);
    phoneEditController = TextEditingController(text: userModel.phone_number);
    genDerEditController = TextEditingController();
    super.onInit();
  }

  void updateDateRange(DateTime newDate) {
    birthday?.value = newDate;
  }

  void selectGender(bool newDate) {
    genDer?.value = newDate;
  }

  Future updateUser() async {
    if (keyForm.currentState!.validate()) {
      try {
        await _userService.updateUser(
          userId: userModel.userId ?? -1,
          body: PutUpdateUserBody(
            phone: phoneEditController.text.trim(),
            fullname: nameEditController.text.trim(),
            gender: genDer?.value,
            avatar: '',
            birthday: birthday?.value,
          ),
        );
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
    nameEditController.text = '';
    phoneEditController.text = '';
    genDerEditController.text = '';
    // birthDayEditController.text = '';
  }
}
