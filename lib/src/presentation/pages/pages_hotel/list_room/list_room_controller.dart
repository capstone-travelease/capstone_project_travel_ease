import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/core/utils/snack_bar_and_loading.dart';
import 'package:capstone_project_travel_ease/src/domain/models/room_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/search_hotel/search_hotel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListRoomController extends GetxController {
  final RxList<RoomModel> listRoom = <RoomModel>[].obs;
  late PagingController<int, RoomModel> pagingController;
  final scrollController = ScrollController();
  int currentPage = 1;
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  final int _pageSize = 10;
  late ArgListRoom argListRoom;
  final RxList<RoomInfo> rooms = <RoomInfo>[].obs;
  SearchHotelController searchHotelController = Get.put(
    SearchHotelController(),
  );
  final RxInt total = 0.obs;
  @override
  void onInit() {
    argListRoom = Get.arguments as ArgListRoom;
    pagingController = PagingController(firstPageKey: 0);
    pagingController.addPageRequestListener(fetchListRoom);
    super.onInit();
  }

  Future<void> fetchListRoom(int pageKey) async {
    try {
      final res = await _bookingService.listRooms(hotelId: argListRoom.hotelId);
      listRoom.call(res);
      final List<RoomInfo> cheapestRooms = await findCheapestRooms(
        numPeople: searchHotelController.numberAdult.toInt(),
        numRooms: searchHotelController.numberRoom.toInt(),
      );
      rooms.call(cheapestRooms);
      total.value =
          cheapestRooms.fold(0, (acc, room) => acc + room.price.toInt());
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

  // đề xuất phòng
  Future<List<RoomInfo>> findCheapestRooms(
      {required int numPeople, required int numRooms}) async {
    if (numPeople <= 0 || numRooms <= 0) {
      throw ArgumentError(
          "Invalid input: Number of people and rooms must be positive.");
    }
    try {
      listRoom
          .sort((a, b) => (a.roomPrice ?? -1).compareTo((b.roomPrice ?? -1)));

      //check các điều kiện đầu vào với data
      final filteredRooms = listRoom.where((room) =>
          (((room.roomCapacity ?? -1) <= numPeople &&
                  (room.roomBedQuantity ?? -1) <= numRooms) ||
              ((room.roomCapacity ?? -1) >= numPeople &&
                  (room.roomBedQuantity ?? -1) >= numRooms)));

      final cheapestRooms = filteredRooms.take(numRooms);

      final List<RoomInfo> roomInfoList = cheapestRooms
          .map(
            (room) => RoomInfo(
              name: room.roomName ?? '',
              price: room.roomPrice ?? -1,
              roomId: room.roomId ?? -1,
            ),
          )
          .toList();

      return roomInfoList;
    } catch (error) {
      Get.log(
        error.toString(),
      ); // Log for debugging
      throw Exception(
        "Failed to fetch room data",
      ); // Rethrow for higher-level handling
    }
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

class RoomInfo {
  final String name;
  final double price;
  final int roomId;
  RoomInfo({
    required this.name,
    required this.price,
    required this.roomId,
  });
}
