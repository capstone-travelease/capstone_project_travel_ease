import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/utils/snack_bar_and_loading.dart';
import 'package:capstone_project_travel_ease/src/domain/models/hotel_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/model_search.dart';
import 'package:capstone_project_travel_ease/src/domain/requests/bodys/post_search_hotel_body.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchHotelController extends GetxController {
  late ArgSearchHotel argSearchHotel;
  final RxList<HotelModel> listHotel = <HotelModel>[].obs;
  late PagingController<int, HotelModel> pagingController;
  final scrollController = ScrollController();
  int currentPage = 1;
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  // final int _pageSize = 10;
  final Rxn<SearchModel> search = Rxn<SearchModel>();
  @override
  void onInit() {
    argSearchHotel = Get.arguments as ArgSearchHotel;

    search.call(SearchModel(
      location: argSearchHotel.location,
      fromDay: argSearchHotel.dateTimeRange.start,
      todDay: argSearchHotel.dateTimeRange.end,
      numberRoom: argSearchHotel.numberRoom,
      numberAdult: argSearchHotel.numberAdult,
    ));
    pagingController = PagingController(firstPageKey: 0);
    pagingController.addPageRequestListener(fetchListHotel);
    super.onInit();
  }

  Future<void> fetchListHotel(
    int pageKey,
  ) async {
    try {
      final res = await _bookingService.searchHotel(
        body: PostSearchHotelBody(
          location: search.value?.location ?? '',
          fromDate: search.value?.fromDay ?? DateTime.now(),
          toDate: search.value?.todDay ??
              DateTime.now().add(
                const Duration(days: 1),
              ),
          adultNumber: search.value?.numberAdult ?? -1,
          roomNumber: search.value?.numberRoom ?? -1,
          facilities: search.value?.facilities,
          hotelName: search.value?.hotelName ?? '',
          priceFrom: search.value?.priceFrom ?? -1,
          priceFromLowToHigh: search.value?.priceFromLowToHigh,
          priceFromHighToLow: search.value?.priceFromHighToLow,
          ratting: search.value?.ratting,
          toPrice: search.value?.toPrice,
        ),
      );
      listHotel.call(res);
      // listHotel.length < _pageSize
      pagingController.appendLastPage(listHotel);
      // : pagingController.appendPage(
      //     listHotel,
      //     pageKey + listHotel.length,
      //   );
    } catch (error) {
      pagingController.error = error;
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();
      SnackBarAndLoading.showSnackBar(
        'Kết nối internet thất bại',
        backgroundColor: Get.theme.colorScheme.error,
      );
      Get.log(
        error.toString(),
      );
    }
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
