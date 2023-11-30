import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  late TextEditingController message;

  @override
  void onInit() {
    message = TextEditingController();

    super.onInit();
  }
}
