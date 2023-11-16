import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class PaymentModel {
  late int id;
  late IconData icon;
  late String namePay;

  late List<Children> children;

  PaymentModel({
    required this.id,
    required this.icon,
    required this.namePay,
    required this.children,
  });
}

class Children {
  late String name;
  late String soTaiKhoan;
  late String image;

  Children({
    required this.name,
    required this.soTaiKhoan,
    required this.image,
  });
}

List<PaymentModel> payment = [
  PaymentModel(
    id: 1,
    icon: Icons.wallet,
    namePay: 'e-wallet',
    children: [
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
    ],
  ),
  PaymentModel(
    id: 2,
    icon: Icons.payment_outlined,
    namePay: 'Bank',
    children: [
      Children(
        name: 'TP Bank',
        soTaiKhoan: '09*** ***092',
        image: Assets.icons.tpbank.path,
      ),
      Children(
        name: 'VCB',
        soTaiKhoan: '09*** ***092',
        image: Assets.icons.vcb.path,
      )
    ],
  ),
  PaymentModel(
    id: 3,
    icon: Icons.qr_code_2_outlined,
    namePay: 'QR code',
    children: [
      Children(
        name: 'Scan & Pay',
        soTaiKhoan: '',
        image: Assets.images.qrcode.path,
      ),
    ],
  ),
];
