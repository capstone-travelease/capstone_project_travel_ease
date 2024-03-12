import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_add_help_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/user_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_successful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpController extends GetxController {
  late TextEditingController ticketIdEditController;
  late TextEditingController nameEditController;
  late TextEditingController contactNumberEditController;
  late TextEditingController emailEditController;
  late TextEditingController messageEditController;
  final RegExp phoneRegex = RegExp(r'^([1-9])?\d{10}$');
  RxBool isBooking = false.obs;
  final keyForm = GlobalKey<FormState>();
  final UserService _userService = Get.find(tag: Constant.uerSerServiceTAG);
  final NotificationConfig notificationConfig = Get.find();

  @override
  void onInit() {
    ticketIdEditController = TextEditingController();
    nameEditController = TextEditingController();
    contactNumberEditController = TextEditingController();
    emailEditController = TextEditingController();
    messageEditController = TextEditingController();
    super.onInit();
  }

  Future<void> onSend() async {
    if (keyForm.currentState!.validate()) {
      try {
        await _userService.help(
          body: PostAddHelpBody(
            ticketId: ticketIdEditController.text.trim() == ''
                ? null
                : int.parse(ticketIdEditController.text.trim()),
            email: emailEditController.text.trim(),
            fullName: nameEditController.text.trim(),
            contactNumber: int.parse(contactNumberEditController.text.trim()),
            noiDung: messageEditController.text.trim(),
            bookingState: isBooking.value,
          ),
        );
        Get.back();
        Get.dialog(
          DiaLogSuccessful(
            onTap: () => Get.offAllNamed(NavigatorMenuPage.routeName),
            text: 'Please wait, we will contact you via email or phone call',
          ),
        );
      } catch (error) {
        String errorMessage = "Có lỗi xảy ra, vui lòng thử lại nhé!";
        notificationConfig.showSnackBar(
          title: 'Thông báo',
          errorMessage,
          backgroundColor: Get.theme.colorScheme.primary,
        );
        Get.log(
          error.toString(),
        );
      }
    }
    _cleanInput();
  }

  void _cleanInput() {
    ticketIdEditController.text = '';
    nameEditController.text = '';
    contactNumberEditController.text = '';
    emailEditController.text = '';
    messageEditController.text = '';
  }

  void selectYesOrNo(int check) {
    if (check == 1) {
      isBooking.call(true);
    } else {
      isBooking.call(false);
    }
  }
}
