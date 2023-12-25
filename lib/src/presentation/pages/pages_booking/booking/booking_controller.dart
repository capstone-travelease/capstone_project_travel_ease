import 'package:capstone_project_travel_ease/src/domain/models/payment_model.dart';
import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_widgets/booking_overview_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_widgets/detail_customer_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_widgets/finish_booking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/login/login_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_successful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  late TextEditingController nameEditController;
  late RxnString nameError = RxnString(null);
  late TextEditingController phoneEditController;
  late RxnString phoneError = RxnString(null);
  late TextEditingController emailEditController;
  late RxnString emailError = RxnString(null);
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
  @override
  void onInit() {
    pageController.addListener(
      () {
        _currentStepAndPage.value = pageController.page!.round();
      },
    );
    emailEditController = TextEditingController();
    nameEditController = TextEditingController();
    phoneEditController = TextEditingController();
    listPayment.call(payment);
    selectPaymentMethod(listPayment.first);

    super.onInit();
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
