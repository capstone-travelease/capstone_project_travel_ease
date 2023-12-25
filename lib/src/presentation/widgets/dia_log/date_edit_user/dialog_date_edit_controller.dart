import 'package:get/get.dart';

class DiaLogDateEditUserController extends GetxController {
  DiaLogDateEditUserController({
    DateTime? initialValue,
  }) {
    date?.value = initialValue ?? DateTime.now();
  }
  Rx<DateTime>? date = DateTime.now().obs;

  void updateDateRange(DateTime newDate) {
    date?.value = newDate;
  }
}
