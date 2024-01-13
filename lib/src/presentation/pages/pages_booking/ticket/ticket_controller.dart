import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/src/domain/models/booking_ticket_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_cancel.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_successful.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TicketController extends GetxController {
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  final Rxn<BookingTicketModel> ticket = Rxn<BookingTicketModel>();
  late int bookingId;
  late String bookingType;
  @override
  void onInit() {
    bookingId = Get.arguments['bookingId'];
    bookingType = Get.arguments['bookingType'];
    fetchTicket();
    super.onInit();
  }

  Future<void> fetchTicket() async {
    try {
      final res = await _bookingService.ticket(bookingId: bookingId);
      ticket.call(res);
    } catch (e) {
      Get.log(e.toString());
    }
  }

  void copyText() {
    Clipboard.setData(
      ClipboardData(text: (ticket.value?.ticketId.toString() ?? '')),
    );
    // Get.snackbar("Copied", "Text copied to clipboard");
  }

  Future<void> canCelBooking() async {
    try {
      await _bookingService.cancelBooking(bookingId: bookingId);
    } catch (e) {
      Get.log(e.toString());
    }
  }

  Future<void> onCanCelBooking() async {
    Get.dialog(
      DiaLogCancel(
        onTap: () => Get.dialog(
          DiaLogSuccessful(
            onTap: () {
              canCelBooking();
              Get.offAllNamed(NavigatorMenuPage.routeName);
            },
            text:
                'You have successfully canceled your order. 80% funds will be returned to your account',
          ),
        ),
      ),
    );
  }
}
