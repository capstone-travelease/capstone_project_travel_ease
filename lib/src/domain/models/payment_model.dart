import 'package:flutter/material.dart';

class PaymentModel {
  late int type;
  late IconData icon;
  late String namePay;

  PaymentModel({
    required this.type,
    required this.icon,
    required this.namePay,
  });
}

List<PaymentModel> payment = [
  PaymentModel(
    type: 1,
    icon: Icons.wallet,
    namePay: 'e-wallet',
  ),
  PaymentModel(
    type: 2,
    icon: Icons.payment_outlined,
    namePay: 'Bank',
  ),
  // PaymentModel(
  //   type: 3,
  //   icon: Icons.qr_code_2_outlined,
  //   namePay: 'QR code',
  // ),
];
