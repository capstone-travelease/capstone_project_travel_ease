import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/my_bookmark/my_bookmark_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookMarkPage extends GetView<MyBookMarkController> {
  static const String routeName = '/MyBookMarkPage';
  const MyBookMarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Get.theme.colorScheme.background,
        title: Text(
          'My Bookmark',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
