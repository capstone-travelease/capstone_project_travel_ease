import 'package:capstone_project_travel_ease/src/domain/enums/enum_value.dart';

class MyBookingTab {
  final MyBookingTabType type;
  MyBookingTab(
    this.type,
  );

  factory MyBookingTab.onGoing() {
    return MyBookingTab(
      MyBookingTabType.onGoing,
    );
  }

  factory MyBookingTab.completed() {
    return MyBookingTab(
      MyBookingTabType.completed,
    );
  }

  factory MyBookingTab.cancelled() {
    return MyBookingTab(
      MyBookingTabType.cancelled,
    );
  }
}
