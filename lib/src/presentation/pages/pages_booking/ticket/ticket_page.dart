import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/chat/chat_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/ticket/ticket_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/hotel_detal/hotel_detail_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketPage extends GetView<TicketController> {
  static const String routeName = '/TicketPage';
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: InkWell(
              onTap: () => Get.toNamed(ChatPage.routeName),
              child: Image.asset(
                fit: BoxFit.fill,
                Assets.icons.chat1.path,
                width: 30,
                height: 30,
              ),
            ),
          )
        ],
        backgroundColor: Get.theme.colorScheme.background,
        title: Text(
          'Ticket',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      HotelAndUserBooking(),
                      BookingDate(),
                      BookingDetailRoom(),
                      MethodAndTotalPayment(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: SizedBox(
                  width: Get.width,
                  child: InkWell(
                    onTap: () => controller.onCanCelBooking(),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: Text(
                              'Cancel Booking',
                              style: Get.textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HotelAndUserBooking extends GetView<TicketController> {
  const HotelAndUserBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Get.toNamed(HotelDetailPage.routeName),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                height: 150,
                child: ExtendedImage.network(
                  'https://www.hotelgrandsaigon.com/wp-content/uploads/sites/227/2017/12/GRAND_SEDK_01.jpg',
                  fit: BoxFit.cover,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  shape: BoxShape.rectangle,
                  loadStateChanged: (ExtendedImageState state) {
                    switch (state.extendedImageLoadState) {
                      case LoadState.loading:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case LoadState.completed:
                        return null;
                      case LoadState.failed:
                        return Image.asset(
                          Assets.images.noImage.path,
                        );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Royale President Hotel',
                  style: Get.textTheme.titleMedium!.copyWith(),
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'ID: ',
                style: Get.textTheme.bodySmall!.copyWith(),
              ),
              TextSpan(
                text: controller.idEditController.text,
                style: Get.textTheme.bodySmall!.copyWith(),
              ),
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: IconButton(
                    onPressed: () => controller.copyText(),
                    icon: const Icon(Icons.copy_rounded),
                  )),
            ],
          ),
        ),
        Text(
          'Hoàng Văn Thắng',
          style: Get.textTheme.titleMedium!.copyWith(),
        ),
        Text(
          'hvthang002@gmail.com',
          style: Get.textTheme.bodyMedium!.copyWith(),
        ),
        Text(
          '0847263884',
          style: Get.textTheme.bodyMedium!.copyWith(),
        ),
      ],
    );
  }
}

class BookingDate extends StatelessWidget {
  const BookingDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Check-in',
                style: Get.textTheme.bodySmall!.copyWith(),
              ),
              Text(
                DateTime.now().formatDateToString(),
                style: Get.textTheme.bodyMedium!.copyWith(),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CustomPaint(painter: DashedLinePainter()),
            ),
          ),
          Column(
            children: [
              Text(
                'Check-in',
                style: Get.textTheme.bodySmall!.copyWith(),
              ),
              Text(
                DateTime.now().formatDateToString(),
                style: Get.textTheme.bodySmall!.copyWith(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 4, startX = 0;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BookingDetailRoom extends StatelessWidget {
  const BookingDetailRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: CustomPaint(
            size: Size(Get.width, 10),
            painter: DashedLinePainter(),
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Standard Room',
                        style: Get.textTheme.titleMedium!
                            .copyWith(color: Colors.redAccent),
                      ),
                      Text(
                        'Number: 1',
                        style: Get.textTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Max Guests: 2',
                      style: Get.textTheme.bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: CustomPaint(
                size: Size(Get.width, 10),
                painter: DashedLinePainter(),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CustomPaint(
            size: Size(Get.width, 10),
            painter: DashedLinePainter(),
          ),
        ),
      ],
    );
  }
}

class MethodAndTotalPayment extends StatelessWidget {
  const MethodAndTotalPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Payment Method',
                style: Get.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
              Text(
                'Credit card',
                style: Get.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Total Price:',
                style: Get.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
              Text(
                '4,500,000đ',
                style: Get.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
