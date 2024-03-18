import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/src/domain/models/booking_ticket_model.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_rating_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_successful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingController extends GetxController {
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  final Rxn<BookingTicketModel> ticket = Rxn<BookingTicketModel>();
  late int bookingId;
  var selectedRating = 0.obs;
  final keyForm = GlobalKey<FormState>();
  final CheckLoginController checkLoginController = Get.find();
  late TextEditingController contentEditController;
  @override
  void onInit() {
    contentEditController = TextEditingController();
    bookingId = Get.arguments['bookingId'];
    fetchTicket();
    super.onInit();
  }

  void updateRating(int rating) {
    selectedRating.value = rating;
  }

  Future<void> fetchTicket() async {
    try {
      final res = await _bookingService.ticket(bookingId: bookingId);
      ticket.call(res);
    } catch (e) {
      Get.log(
        e.toString(),
      );
    }
  }

  Future<void> onSend({required int hotelId}) async {
    if (keyForm.currentState!.validate()) {
      try {
        await _bookingService.postRating(
          body: PostRatingBody(
            hotelId: hotelId,
            userId: checkLoginController.userid.value,
            content: contentEditController.text.trim(),
            starRate: selectedRating.value,
          ),
        );
        // Get.back();
        Get.dialog(
          DiaLogSuccessful(
            onTap: () => Get.offAllNamed(NavigatorMenuPage.routeName),
            text: 'You have successfully rated. Thank you for your feedback!',
          ),
        );
      } catch (error) {
        String errorMessage = "Có lỗi xảy ra, vui lòng thử lại nhé!";
        Get.snackbar(
          'Thông báo',
          errorMessage,
          backgroundColor: Get.theme.colorScheme.primary,
        );
        Get.log(
          error.toString(),
        );
      }
    }
  }
}
