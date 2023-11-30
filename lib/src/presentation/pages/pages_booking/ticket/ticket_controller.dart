import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_cancel.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_successful.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TicketController extends GetxController {
  late TextEditingController idEditController;

  @override
  void onInit() {
    idEditController = TextEditingController(text: '123213123');
    super.onInit();
  }

  void copyText() {
    final text = idEditController.text;
    Clipboard.setData(ClipboardData(text: text));
    // Get.snackbar("Copied", "Text copied to clipboard");
  }

  Future<void> onCanCelBooking() async {
    Get.dialog(
      DiaLogCancel(
        onTap: () => Get.dialog(
          DiaLogSuccessful(
            onTap: () => Get.offAllNamed(NavigatorMenuPage.routeName),
            text:
                'You have successfully canceled your order. 80% funds will be returned to your account',
          ),
        ),
      ),
    );
  }
}
