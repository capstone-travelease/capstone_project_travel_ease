import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/core/utils/snack_bar_and_loading.dart';
import 'package:capstone_project_travel_ease/src/domain/models/room_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListRoomController extends GetxController {
  final RxList<String> listImage = <String>[].obs;
  List<String> dsImage = [
    'https://www.hotelgrandsaigon.com/wp-content/uploads/sites/227/2017/12/GRAND_SEDK_01.jpg',
    'https://images.squarespace-cdn.com/content/v1/5aadf482aa49a1d810879b88/1626698419120-J7CH9BPMB2YI728SLFPN/1.jpg',
    'https://asiky.com/files/images/Article/tin-tuc/chup-anh-khach-san.jpg',
    'https://cf.bstatic.com/xdata/images/hotel/max1024x768/382586584.jpg?k=c615c33d39628661129df3581cdf4eacc434cccdd69ed4fc62be839d28f526af&o=&hp=1'
  ];
  final RxList<RoomModel> listRoom = <RoomModel>[].obs;
  late PagingController<int, RoomModel> pagingController;
  final scrollController = ScrollController();
  int currentPage = 1;
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  final int _pageSize = 10;
  late ArgListRoom argListRoom;
  @override
  void onInit() {
    argListRoom = Get.arguments as ArgListRoom;
    pagingController = PagingController(firstPageKey: 0);
    pagingController.addPageRequestListener(fetchListRoom);
    loadData();
    super.onInit();
  }

  Future<void> fetchListRoom(int pageKey) async {
    try {
      final res = await _bookingService.listRooms(hotelId: argListRoom.hotelId);
      listRoom.call(res);
      listRoom.length < _pageSize
          ? pagingController.appendLastPage(listRoom)
          : pagingController.appendPage(
              listRoom,
              pageKey + listRoom.length,
            );
    } catch (error) {
      pagingController.error = error;
      if (Get.isSnackbarOpen) Get.closeAllSnackbars();
      SnackBarAndLoading.showSnackBar(
        'Kết nối internet thất bại',
        backgroundColor: Get.theme.colorScheme.error,
      );
      Get.log(error.toString());
    }
  }

  Future<void> loadData() async {
    listImage.call(dsImage);
  }
}

class ArgListRoom {
  ArgListRoom({
    required this.location,
    required this.hotelName,
    required this.hotelId,
  });
  final String location;
  final String hotelName;
  final int hotelId;
}
