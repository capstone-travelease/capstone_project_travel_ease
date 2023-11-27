import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketPage extends StatelessWidget {
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
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_outlined,
                color: Colors.black,
              ))
        ],
        backgroundColor: Get.theme.colorScheme.background,
        title: Text(
          'Ticket',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  fit: BoxFit.fill,
                  Assets.images.backgroundTicket.path,
                  width: 400,
                  height: 500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
