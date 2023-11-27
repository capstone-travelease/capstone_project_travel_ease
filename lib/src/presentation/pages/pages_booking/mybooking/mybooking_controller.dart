import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/domain/models/mybookingtab.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  final CheckLoginController checkLoginController = Get.find();
  Rxn<MyBookingTab> selected = Rxn();
  List<MyBookingTab> tabs = [
    MyBookingTab.onGoing(),
    MyBookingTab.completed(),
    MyBookingTab.cancelled(),
  ];
  @override
  void onInit() {
    tabController = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: 0,
    );
    selected.call(tabs.first);
    // checkLoginController.checkLogin();
    super.onInit();
  }

  Future<void> onTabChanged(MyBookingTab tab) async {
    selected.call(tab);
    tabController?.animateTo(tabs.indexOf(tab));
  }

  Future<void> pushLogin() async {
    await Get.toNamed(LoginView.routeName);
    await checkLoginController.checkLogin();
  }
}
