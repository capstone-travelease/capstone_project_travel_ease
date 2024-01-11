import 'package:get/get.dart';

class RoomCardModel {
  final String name;
  final double price;
  final int roomId;
  RxInt roomQuantity;
  RoomCardModel({
    required this.name,
    required this.price,
    required this.roomId,
    required this.roomQuantity,
  });
}
