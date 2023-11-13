// import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';

abstract class NotificationConfig {
  void showSnackBar(String noiDung,
      {Color? backgroundColor, String title = 'Thông báo'});
  // void showLoading();

  void hideLoading();

  Widget noDataWidget(String noiDung,
      {required bool isSearch, required Future Function()? refresh});
  Widget loadMoreWidget();
}
