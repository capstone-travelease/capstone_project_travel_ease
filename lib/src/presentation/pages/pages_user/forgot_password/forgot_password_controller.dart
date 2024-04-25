import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_forgot_password_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_successful.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassWordController extends GetxController {
  late TextEditingController emailEditController;
  final UserService _userService = Get.find(tag: Constant.uerSerServiceTAG);
  final NotificationConfig notificationConfig = Get.find();
  @override
  void onInit() {
    emailEditController = TextEditingController();
    super.onInit();
  }

  Future<void> sendForgotPass() async {
    try {
      await _userService.forgetPassWord(
        body: PostForgotPassWordBody(
          email: emailEditController.text.trim(),
        ),
      );
      Get.back();
      Get.dialog(
        DiaLogSuccessful(
          onTap: () => Get.back(),
          text:
              'The password has been sent to your email, please check and log in to place your order.',
        ),
      );
    } catch (error) {
      String errorMessage = "Có lỗi xảy ra, thử lại nhé!";
      if (error is DioException) {
        if (error.response?.statusCode == 404 &&
            error.response?.data['message'] != null) {
          errorMessage = "Email không tồn tại trong hệ thống!";
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
}
