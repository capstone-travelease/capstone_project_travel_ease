// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyBookingModel _$MyBookingModelFromJson(Map<String, dynamic> json) =>
    MyBookingModel(
      bookingId: json['bookingId'] as int?,
      hotelId: json['hotelId'] as int?,
      hotelName: json['hotelName'] as String?,
      hotelAddress: json['hotelAddress'] as String?,
      hotelCity: json['hotelCity'] as String?,
      fileUrl: json['fileUrl'] as String?,
      bookingStatus: json['bookingStatus'] as String?,
      ratePoint: (json['ratePoint'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MyBookingModelToJson(MyBookingModel instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'hotelId': instance.hotelId,
      'hotelName': instance.hotelName,
      'hotelAddress': instance.hotelAddress,
      'bookingStatus': instance.bookingStatus,
      'fileUrl': instance.fileUrl,
      'ratePoint': instance.ratePoint,
      'hotelCity': instance.hotelCity,
    };
