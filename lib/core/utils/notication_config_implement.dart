import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/core/utils/snack_bar_and_loading.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/custom_no_data_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationConfigImplement implements NotificationConfig {
  // // TODO: implement dialog

  @override
  // void showLoading() => SnackBarAndLoading.showLoading();

  @override
  void showSnackBar(String noiDung,
      {Color? backgroundColor, String title = 'Thông báo'}) {
    SnackBarAndLoading.showSnackBar(noiDung,
        title: title, backgroundColor: backgroundColor ?? Colors.green);
  }

  @override
  Widget noDataWidget(String noiDung,
      {required bool isSearch, required RefreshNoDataCallback? refresh}) {
    if (refresh != null) {
      return LayoutBuilder(builder: (context, viewportConstraints) {
        return RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: viewportConstraints.copyWith(
                minHeight: viewportConstraints.maxHeight,
                maxHeight: double.infinity,
              ),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomNoDataWidget(
                    noiDung: noiDung,
                    isSearch: isSearch,
                  )
                ],
              ),
            ),
          ),
        );
      });
    }
    return CustomNoDataWidget(
      noiDung: noiDung,
      isSearch: isSearch,
    );
  }

  @override
  void hideLoading() => SnackBarAndLoading.hideLoading();

  @override
  Widget loadMoreWidget() => SizedBox(
        height: 30,
        child: Center(
          child: CupertinoActivityIndicator(
              radius: 10.0, color: Get.theme.colorScheme.primary),
        ),
      );
}

typedef RefreshNoDataCallback = Future<void> Function();
