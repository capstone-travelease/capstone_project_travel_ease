import 'package:equatable/equatable.dart';

class PostBookingBody extends Equatable {
  const PostBookingBody({
    required this.hotelId,
    required this.checkinDate,
    required this.checkoutDate,
    required this.userId,
    this.note,
    required this.taxes,
    required this.totalPrice,
    required this.productList,
    required this.accountId,
  });
  final int hotelId;
  final int? userId;
  final DateTime checkinDate;
  final DateTime checkoutDate;
  final String? taxes;
  final int? totalPrice;
  final List<ProductList>? productList;
  final String? note;
  final int? accountId;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'hotelId': hotelId,
      'userId': userId,
      'checkinDate': checkinDate.toIso8601String(),
      'checkoutDate': checkoutDate.toIso8601String(),
      'productList': productList?.map((e) => e.toJson()).toList(),
      'taxes': taxes,
      'totalPrice': totalPrice,
      'accountId': accountId,
    };
  }

  PostBookingBody copyWith({
    int? hotelId,
    int? userId,
    DateTime? checkinDate,
    DateTime? checkoutDate,
    String? taxes,
    int? totalPrice,
    List<ProductList>? productList,
    String? note,
    int? accountId,
  }) {
    return PostBookingBody(
      hotelId: hotelId ?? this.hotelId,
      userId: userId ?? this.userId,
      checkinDate: checkinDate ?? this.checkinDate,
      checkoutDate: checkoutDate ?? this.checkoutDate,
      taxes: taxes ?? this.taxes,
      totalPrice: totalPrice ?? this.totalPrice,
      note: note ?? this.note,
      productList: productList ?? this.productList,
      accountId: accountId ?? this.accountId,
    );
  }

  @override
  String toString() {
    return 'PostBookingBody( hotelId: $hotelId, userId: $userId,checkinDate: $checkinDate,checkoutDate: $checkoutDate,taxes: $taxes,totalPrice: $totalPrice,productList: $productList,accountId: $accountId)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        hotelId,
        userId,
        accountId,
        checkinDate,
        checkoutDate,
        totalPrice,
        productList,
        note,
        taxes,
      ];
}

class ProductList extends Equatable {
  const ProductList({
    required this.roomId,
    required this.roomQuantity,
    required this.roomPrice,
  });
  final int roomId;
  final int roomQuantity;
  final int roomPrice;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'roomId': roomId,
      'roomQuantity': roomQuantity,
      'roomPrice': roomPrice,
    };
  }

  ProductList copyWith({
    int? roomId,
    int? roomQuantity,
    int? roomPrice,
  }) {
    return ProductList(
      roomId: roomId ?? this.roomId,
      roomQuantity: roomQuantity ?? this.roomQuantity,
      roomPrice: roomPrice ?? this.roomPrice,
    );
  }

  @override
  String toString() {
    return 'ProductList(roomId: $roomId, roomQuantity: $roomQuantity,roomPrice: $roomPrice)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        roomId,
        roomQuantity,
        roomPrice,
      ];
}
