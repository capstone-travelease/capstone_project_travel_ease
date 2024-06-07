import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/domain/models/bank_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_add_card_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_payment_page.dart';

class AddNewPaymentController extends GetxController {
  final RxList<BanksModel> listBanks = <BanksModel>[].obs;
  late TextEditingController stkEditController;
  late TextEditingController nameEditController;
  final Rxn<BanksModel> selectedPayment = Rxn();
  final RxBool isLoading = true.obs;
  final keyForm = GlobalKey<FormState>();
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  late int bankType;
  final NotificationConfig notificationConfig = Get.find();
  final CheckLoginController checkLoginController = Get.find();
  final BookingController bookingController = Get.find();
  @override
  void onInit() {
    bankType = Get.arguments['roomId'];
    stkEditController = TextEditingController();
    nameEditController = TextEditingController();
    fetchListBank();
    super.onInit();
  }

  Future<void> fetchListBank() async {
    try {
      final res = await _bookingService.listBank(bankType: bankType);
      listBanks.call(res);
    } catch (error) {
      Get.log(
        error.toString(),
      );
    }
    isLoading.call(false);
  }

  void selectLocation(BanksModel? value) async {
    if (selectedPayment.value != value) {
      selectedPayment.call(value);
      Get.dialog(AddPay(banksModel: selectedPayment.value!));
      return;
    }
    selectedPayment.value = null;
  }

  Future<void> back() async {
    Get.back();
    await bookingController.fetchListBankAccount();
  }

  Future<void> sendBankLink({required PutAddCardBody itemBank}) async {
    try {
      await _bookingService.bankLink(
        userId: checkLoginController.userid.value,
        body: PutAddCardBody(
          bankId: itemBank.bankId,
          accountName: itemBank.accountName,
          accountNumber: itemBank.accountNumber,
        ),
      );
      _cleanInput();
      Get.back();
      notificationConfig.showSnackBar(
        title: 'Thông báo',
        'Liên kết Thanh Toán Thành Công <3',
        backgroundColor: Colors.greenAccent,
      );
    } catch (error) {
      Get.log(
        error.toString(),
      );
    }
  }

  void _cleanInput() {
    nameEditController.text = '';
    stkEditController.text = '';
  }
}
