import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/utils/snack_bar_and_loading.dart';
import 'package:capstone_project_travel_ease/src/domain/models/my_booking_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/get_my_booking_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/domain/models/mybookingtab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyBookingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final CheckLoginController checkLoginController = Get.find();
  Rxn<MyBookingTab> selected = Rxn();
  List<MyBookingTab> tabs = [
    MyBookingTab.onGoing(),
    MyBookingTab.completed(),
    MyBookingTab.cancelled(),
  ];
  final RxList<MyBookingModel> listBooking = <MyBookingModel>[].obs;
  late PagingController<int, MyBookingModel> pagingController;
  final scrollController = ScrollController();
  int currentPage = 1;
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  final int _pageSize = 10;
  @override
  void onInit() {
    selected.call(tabs.first);
    pagingController = PagingController(firstPageKey: 0);
    pagingController.addPageRequestListener(fetchListMyBooking);
    super.onInit();
  }

  Future<void> fetchListMyBooking(int pageKey) async {
    try {
      final res = await _bookingService.listMyBooking(
        body: GetMyBookingBody(
            userId: checkLoginController.userid.value,
            statusName: selected.value?.type.title ?? ''),
      );
      listBooking.call(res);
      listBooking.length < _pageSize
          ? pagingController.appendLastPage(listBooking)
          : pagingController.appendPage(
              listBooking,
              pageKey + listBooking.length,
            );
    } catch (error) {
      pagingController.error = error;
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();
      SnackBarAndLoading.showSnackBar(
        'Kết nối internet thất bại',
        backgroundColor: Get.theme.colorScheme.error,
      );
      Get.log(
        error.toString(),
      );
    }
  }

  Future<void> onTabChanged(MyBookingTab tab) async {
    selected.call(tab);
    pagingController.refresh();
  }
}
