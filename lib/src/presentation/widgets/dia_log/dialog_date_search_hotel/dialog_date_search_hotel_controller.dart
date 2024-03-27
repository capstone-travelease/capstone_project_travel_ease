import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaLogDateController extends GetxController {
  Rx<DateTimeRange>? dateRange = DateTimeRange(
    end: DateTime.now().add(const Duration(days: 1)),
    start: DateTime.now(),
  ).obs;

  void updateDateRange(DateTimeRange newDateRange) {
    dateRange?.value = newDateRange;
  }
}
