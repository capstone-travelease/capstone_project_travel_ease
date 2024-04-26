// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListModel _$ProductListModelFromJson(Map<String, dynamic> json) =>
    ProductListModel(
      json['roomPrice'] as int?,
      roomName: json['roomName'] as String?,
      maxGuest: json['maxGuest'] as int?,
      numberRoom: json['numberRoom'] as int?,
    );

Map<String, dynamic> _$ProductListModelToJson(ProductListModel instance) =>
    <String, dynamic>{
      'roomName': instance.roomName,
      'maxGuest': instance.maxGuest,
      'numberRoom': instance.numberRoom,
      'roomPrice': instance.roomPrice,
    };
