import 'package:capstone_project_travel_ease/core/utils/noti_config.dart';
import 'package:capstone_project_travel_ease/src/domain/models/model_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetSearchHotelController extends GetxController {
  final Rxn<SearchModel> search = Rxn<SearchModel>();
  Rx<DateTimeRange> dateRange = DateTimeRange(
    end: DateTime.now().add(const Duration(days: 2)),
    start: DateTime.now(),
  ).obs;
  final NotificationConfig tinTucConfig = Get.find();
  final RxInt numberRoom = 1.obs;
  final RxInt numberAdult = 2.obs;
  List<String> dsTp = ['Hồ Chi Minh', 'Đà Lạt', 'Đà Nẵng', 'Hà Nội'];
  final RxList<String> listitem = <String>[].obs;
  final Rxn<String> selectedLocation = Rxn();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

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

  Future<void> fetchData() async {
    listitem.call(dsTp);
  }

  void selectLocation(String? value) {
    if (selectedLocation.value != value) {
      selectedLocation.call(value);
      // location = value;
      // Get.back(result: selectedLocation.value);
      return;
    }
  }

  void updateRoomAndAdult(int room, int adult) {
    numberRoom.value = room;
    numberAdult.value = adult;
  }
}
