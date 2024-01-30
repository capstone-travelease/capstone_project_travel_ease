import 'package:capstone_project_travel_ease/core/utils/error_empty.dart';
import 'package:capstone_project_travel_ease/core/utils/extension.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/help/help_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpPage extends GetView<HelpController> {
  static const String routeName = '/HelpPage';
  const HelpPage({Key? key}) : super(key: key);

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
        backgroundColor: Get.theme.colorScheme.background,
        title: Text(
          'Help',
          style: Get.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Do you have a booking?',
                style: Get.textTheme.bodyMedium!.copyWith(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Obx(
                          () => InkWell(
                            onTap: () => controller.selectYesOrNo(1),
                            child: Icon(
                              controller.isBooking.value == true
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: controller.isBooking.value == true
                                  ? Colors.redAccent
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(text: '  Yes', style: Get.textTheme.bodyMedium!),
                      const TextSpan(
                        text: '                    ',
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Obx(
                          () => InkWell(
                            onTap: () => controller.selectYesOrNo(0),
                            child: Icon(
                              controller.isBooking.value == false
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: controller.isBooking.value == false
                                  ? Colors.redAccent
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(text: '  No', style: Get.textTheme.bodyMedium!)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Form(
                  key: controller.keyForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => controller.isBooking.value == true
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ticket ID ',
                                    style: Get.theme.textTheme.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return value.checkEmpty(
                                            ErrorAndIsEmtys.ticketId);
                                      }
                                      return null;
                                    },
                                    controller:
                                        controller.ticketIdEditController,
                                    style: context.theme.textTheme.bodyMedium
                                        ?.copyWith(
                                            // color: context.theme.hintColor,
                                            ),
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      hintText: 'Ticket ID',
                                      hintStyle: context
                                          .theme.textTheme.bodySmall
                                          ?.copyWith(color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Full Name',
                        style: Get.theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return value.checkEmpty(ErrorAndIsEmtys.name);
                          }
                          if (controller.nameEditController.text.length > 30) {
                            return ErrorAndIsEmtys.nameError;
                          }
                          return null;
                        },
                        controller: controller.nameEditController,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'Full name',
                          hintStyle: context.theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[500]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Contact Number',
                        style: Get.theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return value.checkEmpty(ErrorAndIsEmtys.phone);
                          }
                          if (!controller.phoneRegex.hasMatch(controller
                              .contactNumberEditController.text
                              .trim())) {
                            return ErrorAndIsEmtys.phoneError;
                          }
                          return null;
                        },
                        controller: controller.contactNumberEditController,
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'Contact number',
                          hintStyle: context.theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[500]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Email',
                        style: Get.theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        controller: controller.emailEditController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return value.checkEmpty(ErrorAndIsEmtys.email);
                          }
                          if (!controller.emailEditController.text
                              .contains('@')) {
                            return ErrorAndIsEmtys.emailWrongFormat;
                          }
                          return null;
                        },
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        decoration: InputDecoration(
                          // errorText: controller.passwordError.value,
                          alignLabelWithHint: true,
                          hintText: 'mail@example.com',
                          hintStyle: context.theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[500]),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Write your message',
                        style: Get.theme.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextFormField(
                        controller: controller.messageEditController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return value
                                .checkEmpty(ErrorAndIsEmtys.messageHelp);
                          }
                          return null;
                        },
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                            // color: context.theme.hintColor,
                            ),
                        maxLines: 4,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'Your message',
                          hintStyle: context.theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[500]),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: GestureDetector(
                          onTap: () => controller.onSend(),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.redAccent),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Submit',
                                  style: Get.theme.textTheme.titleMedium
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
