import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  late TextEditingController nameEditController;
  late TextEditingController phoneEditController;
  late TextEditingController emailEditController;
  late TextEditingController genDerEditController;
  late TextEditingController birthDayEditController;
  Rx<File> image = Rx(File(''));
  @override
  void onInit() {
    emailEditController = TextEditingController(text: 'anh@gmail.com');
    nameEditController = TextEditingController(text: 'anh');
    phoneEditController = TextEditingController(text: '0987654321');
    genDerEditController = TextEditingController();
    birthDayEditController = TextEditingController();
    super.onInit();
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
}
