// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      roomId: json['room_id'] as int?,
      roomName: json['room_name'] as String?,
      roomDescription: json['room_description'] as String?,
      roomSize: json['room_size'] as String?,
      roomBedQuantity: json['room_bed_quantity'] as int?,
      roomCapacity: json['room_capacity'] as int?,
      roomPrice: (json['room_price'] as num?)?.toDouble(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => FacilitiesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'room_id': instance.roomId,
      'room_name': instance.roomName,
      'room_description': instance.roomDescription,
      'room_size': instance.roomSize,
      'room_bed_quantity': instance.roomBedQuantity,
      'room_capacity': instance.roomCapacity,
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'facilities': instance.facilities?.map((e) => e.toJson()).toList(),
      'room_price': instance.roomPrice,
    };
