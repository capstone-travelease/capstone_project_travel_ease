import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/domain/enums/enum_value.dart';

class MyBookingTab {
  final MyBookingTabType type;
  final String image;
  final String textNoLogin;
  final String status;
  MyBookingTab(
    this.type,
    this.image,
    this.textNoLogin,
    this.status,
  );

  factory MyBookingTab.onGoing() {
    return MyBookingTab(
      MyBookingTabType.onGoing,
      Assets.images.ongoing.path,
      'No Reservations',
      'Paid',
    );
  }

  factory MyBookingTab.completed() {
    return MyBookingTab(
      MyBookingTabType.completed,
      Assets.images.completed.path,
      'There are no past reservations',
      'Completed',
    );
  }

  factory MyBookingTab.cancelled() {
    return MyBookingTab(
      MyBookingTabType.cancelled,
      Assets.images.cancelled.path,
      'There are no canceled reservations',
      'Cancelled & Refunded',
    );
  }
  factory MyBookingTab.unpaid() {
    return MyBookingTab(
      MyBookingTabType.unpaid,
      Assets.images.cancelled.path,
      'You Do Not Have a Reservation Yet',
      'Unpaid',
    );
  }
}
