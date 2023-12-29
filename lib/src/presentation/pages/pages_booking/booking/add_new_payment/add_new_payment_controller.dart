import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/domain/models/payment_model.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/add_new_payment/add_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewPaymentController extends GetxController {
  final RxList<Children> listPayment = <Children>[].obs;
  late TextEditingController stkEditController;
  late TextEditingController nameEditController;
  final Rxn<Children> selectedPayment = Rxn();
  final RxBool isLoading = true.obs;
  final keyForm = GlobalKey<FormState>();
  @override
  void onInit() {
    stkEditController = TextEditingController();
    nameEditController = TextEditingController();
    listPayment.call(children);
    super.onInit();
  }

  void selectLocation(Children? value) async {
    if (selectedPayment.value != value) {
      selectedPayment.call(value);
      return;
    }
    selectedPayment.value = null;
  }
}

List<Children> children = [
  Children(
    name: 'MoMo',
    soTaiKhoan: '0987654321',
    image: Assets.icons.momo.path,
  ),
  Children(
    name: 'ZaloPay',
    soTaiKhoan: '0987654321',
    image: Assets.icons.zalopay.path,
  ),
  Children(
    name: 'VNPay',
    soTaiKhoan: '0987654321',
    image: Assets.icons.vnpay.path,
  ),
];
