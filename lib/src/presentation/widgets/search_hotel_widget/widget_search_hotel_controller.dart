import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/domain/models/location_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/model_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetSearchHotelController extends GetxController {
  final Rxn<SearchModel> search = Rxn<SearchModel>();
  Rx<DateTimeRange> dateRange = DateTimeRange(
    end: DateTime.now().add(const Duration(days: 1)),
    start: DateTime.now(),
  ).obs;
  final NotificationConfig tinTucConfig = Get.find();
  final RxInt numberRoom = 1.obs;
  final RxInt numberAdult = 2.obs;
  final Rxn<LocationModel> selectedLocation = Rxn();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future<void> onUpdateSearch(SearchModel data) async {
    search.call(data);
  }

  void updateDateRange(DateTimeRange newDateRange) {
    dateRange.value = newDateRange;
  }

  void incrementRoom() {
    numberRoom.value++;
  }

  void decrementRoom() {
    if (numberRoom.value > 0) {
      numberRoom.value--;
    }
  }

  void incrementAdult() {
    numberAdult.value++;
  }

  void decrementAdult() {
    if (numberAdult.value > 0) {
      numberAdult.value--;
    }
  }

  void selectLocation(LocationModel? value) {
    if (selectedLocation.value != value) {
      selectedLocation.call(value);
      return;
    }
  }

  void updateRoomAndAdult(int room, int adult) {
    numberRoom.value = room;
    numberAdult.value = adult;
  }
}
