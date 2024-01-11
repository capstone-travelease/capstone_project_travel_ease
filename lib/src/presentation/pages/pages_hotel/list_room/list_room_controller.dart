import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/utils/snack_bar_and_loading.dart';
import 'package:capstone_project_travel_ease/src/domain/models/room_card_model.dart';
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
  SearchHotelController searchHotelController = Get.put(
    SearchHotelController(),
  );
  final RxInt totalPrice = 0.obs;
  final RxInt totalRoom = 0.obs;
  final Map<int, RxInt> roomQuantities = {};
  RxList<RoomCardModel> roomCards = <RoomCardModel>[].obs;
  @override
  void onInit() {
    argListRoom = Get.arguments as ArgListRoom;
    pagingController = PagingController(firstPageKey: 0);
    pagingController.addPageRequestListener(fetchListRoom);
    for (var roomModel in listRoom) {
      roomQuantities[roomModel.roomId ?? 0] = 1.obs;
    }
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

  RxInt getRoomQuantity(int roomId) {
    return roomQuantities[roomId] ??= 1.obs;
  }

  void incrementRoom(RoomModel roomModel) {
    if (roomModel.roomId == null) return;
    final RxInt roomQuantity = getRoomQuantity(roomModel.roomId ?? 0);
    if ((roomModel.roomQuantity != null) &&
        (roomQuantity.value >= (roomModel.roomQuantity ?? -1))) return;

    roomQuantity.value = roomQuantity.value + 1;
    addSelectedRoom(roomModel);
  }

  void decrementRoom(RoomModel roomModel) {
    if (roomModel.roomId == null) return;
    final RxInt roomQuantity = getRoomQuantity(roomModel.roomId ?? 0);
    if (roomQuantity.value > 1) {
      roomQuantity.value = roomQuantity.value + -1;
      removeSelectedRoom((roomModel.roomId ?? -1));
    }
  }

  void addSelectedRoom(RoomModel room) {
    if (room.roomId == null) return;
    final RxInt roomQuantity = getRoomQuantity(room.roomId ?? 0);
    final existingRoomIndex =
        roomCards.indexWhere((element) => element.roomId == room.roomId);

    if (existingRoomIndex != -1) {
      roomCards[existingRoomIndex].roomQuantity = roomQuantity;
      totalPrice.value += room.roomPrice!.toInt();
      totalRoom.value += 1;
    } else {
      // Add new room with quantity and price
      roomCards.add(
        RoomCardModel(
          name: room.roomName ?? '',
          price: room.roomPrice ?? 0.0,
          roomId: room.roomId ?? 0,
          roomQuantity: roomQuantity,
        ),
      );
      totalPrice.value += room.roomPrice!.toInt() * roomQuantity.value.toInt();
      totalRoom.value += roomQuantity.value.toInt();
    }
  }

  void removeSelectedRoom(int roomId) {
    final roomIndex =
        roomCards.indexWhere((element) => element.roomId == roomId);

    if (roomIndex != -1) {
      totalPrice.value -= roomCards[roomIndex].price.toInt();
      totalRoom.value -= 1;
      // If quantity is 0, remove room
      // if (roomCards[roomIndex].roomQuantity == 1) {
      //   roomCards.removeAt(roomIndex);
      // }
    }
  }

  void cleanRoomsSelected(int roomId) {
    final RxInt roomQuantity = getRoomQuantity(roomId);
    RoomCardModel selectedRoom = roomCards.firstWhere(
      (room) => room.roomId == roomId,
      // orElse: () => null,
    );
    roomCards.remove(selectedRoom);
    totalPrice.value -= selectedRoom.price.toInt() * roomQuantity.value.toInt();
    totalRoom.value -= 1;
    roomQuantities.remove(roomId);
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
