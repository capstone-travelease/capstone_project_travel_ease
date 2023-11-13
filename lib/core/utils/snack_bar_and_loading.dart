import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarAndLoading {
  static void showSnackBar(
    String noiDung, {
    String title = 'Thông báo',
    Widget? icon,
    Color textColor = Colors.white,
    Color backgroundColor = Colors.green,
    Duration? thoiGian = const Duration(seconds: 2),
    SnackPosition? position,
    double barBlur = 50,
  }) {
    Get.snackbar(
      title,
      noiDung,
      colorText: textColor,
      barBlur: barBlur,
      duration: thoiGian,
      snackPosition: position,
      backgroundColor: backgroundColor,
      icon: icon,
    );
  }

  // static void showLoading() {
  //   Get.dialog(
  //     const LoaderWidget(),
  //     barrierDismissible: false,
  //   );
  // }

  static void hideLoading() {
    Get.back();
  }
}
