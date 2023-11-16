import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchHotelController extends GetxController {
  final Rxn<String> location = Rxn();
  final RxInt numberRoom = 0.obs;
  final RxInt numberAdult = 0.obs;
  final Rxn<DateTimeRange> dateRange = Rxn();
  late ArgSearchHotel argSearchHotel;
  // late PagingController<int, String> pagingController;
  // final scrollController = ScrollController();
  @override
  void onInit() {
    argSearchHotel = Get.arguments as ArgSearchHotel;
    location.value = argSearchHotel.location;
    dateRange.value = argSearchHotel.dateTimeRange;
    numberRoom.value = argSearchHotel.numberRoom;
    numberAdult.value = argSearchHotel.numberAdult;
    // pagingController = PagingController(firstPageKey: 0);
    // pagingController.addPageRequestListener();
    super.onInit();
  }
}

class ArgSearchHotel {
  ArgSearchHotel({
    required this.dateTimeRange,
    required this.location,
    required this.numberRoom,
    required this.numberAdult,
  });
  final DateTimeRange dateTimeRange;
  final String location;
  final int numberRoom;
  final int numberAdult;
}
