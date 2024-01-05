import 'dart:ffi';

import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/src/domain/models/payment_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/room_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_widgets/booking_overview_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_widgets/detail_customer_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_widgets/finish_booking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_successful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  late TextEditingController nameEditController;
  late TextEditingController phoneEditController;
  late TextEditingController emailEditController;
  late TextEditingController couponEditController;
  late TextEditingController noteEditController;
  final keyForm = GlobalKey<FormState>();
  final _currentStepAndPage = 0.obs;
  final pageController = PageController();
  int get currentStepAndPage => _currentStepAndPage.value;
  final pages = const [
    DetailCustomerPage(),
    BookingOverviewPage(),
    FinishBookingPage()
  ].obs;
  final RegExp phoneRegex = RegExp(r'^([1-9])?\d{10}$');
  final RxList<PaymentModel> listPayment = <PaymentModel>[].obs;
  final Rxn<Children> selectedPayment = Rxn();
  final CheckLoginController checkLoginController = Get.find();
  final Rxn<PaymentModel> selectedPaymentMethod = Rxn();
  late int roomId;
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  final Rxn<RoomModel> room = Rxn<RoomModel>();
  @override
  void onInit() {
    roomId = Get.arguments['roomId'];
    pageController.addListener(
      () {
        _currentStepAndPage.value = pageController.page!.round();
      },
    );
    emailEditController = TextEditingController(
        text: checkLoginController.user.value?.email ?? '');
    nameEditController = TextEditingController(
        text: checkLoginController.user.value?.fullName ?? '');
    phoneEditController = TextEditingController(
        text: checkLoginController.user.value?.phoneNumber ?? '');
    listPayment.call(payment);
    selectPaymentMethod(listPayment.first);
    fetchRoomDetail();
    super.onInit();
  }

  Future<void> fetchRoomDetail() async {
    try {
      final res = await _bookingService.detailRoom(roomId: roomId);
      room.call(res);
    } catch (e) {
      Get.log(
        e.toString(),
      );
    }
  }

  void goToStepAndPage(int index) {
    pageController.jumpToPage(index);
    _currentStepAndPage.value = index;
  }

  void nextToStepAndPage() {
    final isLastPage = _currentStepAndPage.value == pages.length - 1;
    final isNextPage = _currentStepAndPage.value == pages.length - 2;
    final next = _currentStepAndPage.value + 1;
    if (isLastPage) {
      onPayment();
      return;
    } else if (isNextPage) {
      goToStepAndPage(next);
    } else {
      if (keyForm.currentState!.validate()) {
        goToStepAndPage(next);
      }
    }
  }

  Future<void> onPayment() async {
    Get.dialog(
      DiaLogSuccessful(
        onTap: () => Get.offAllNamed(NavigatorMenuPage.routeName),
        text: 'You have successfully booked. Please check your email inbox',
      ),
    );
  }

  void selectPaymentMethod(PaymentModel? value) {
    if (selectedPaymentMethod.value != value) {
      selectedPaymentMethod.call(value);
      selectPayment(value?.children.first);
      return;
    }
  }

  void selectPayment(Children? value) {
    if (selectedPayment.value != value) {
      selectedPayment.call(value);
      return;
    }
  }
}

class ArgSearchHotel {
  ArgSearchHotel({
    required this.roomName,
    required this.price,
  });
  final String roomName;
  final Double price;
}
