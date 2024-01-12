// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingTicketModel _$BookingTicketModelFromJson(Map<String, dynamic> json) =>
    BookingTicketModel(
      ticketId: json['ticketId'] as int?,
      hotelName: json['hotelName'] as String?,
      hotelCity: json['hotelCity'] as String?,
      fileUrl: json['fileUrl'] as String?,
      userName: json['userName'] as String?,
      userEmail: json['userEmail'] as String?,
      userPhone: json['userPhone'] as String?,
      checkOutDate: json['checkOutDate'] == null
          ? null
          : DateTime.parse(json['checkOutDate'] as String),
      checkInDate: json['checkInDate'] == null
          ? null
          : DateTime.parse(json['checkInDate'] as String),
      productList: (json['productList'] as List<dynamic>?)
          ?.map((e) => ProductListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentMethod: json['paymentMethod'] as String?,
      totalPrice: json['totalPrice'] as int?,
    );

Map<String, dynamic> _$BookingTicketModelToJson(BookingTicketModel instance) =>
    <String, dynamic>{
      'ticketId': instance.ticketId,
      'hotelName': instance.hotelName,
      'hotelCity': instance.hotelCity,
      'userName': instance.userName,
      'fileUrl': instance.fileUrl,
      'userEmail': instance.userEmail,
      'userPhone': instance.userPhone,
      'checkInDate': instance.checkInDate?.toIso8601String(),
      'checkOutDate': instance.checkOutDate?.toIso8601String(),
      'productList': instance.productList?.map((e) => e.toJson()).toList(),
      'paymentMethod': instance.paymentMethod,
      'totalPrice': instance.totalPrice,
    };
