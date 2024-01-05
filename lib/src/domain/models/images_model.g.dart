// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesModel _$ImagesModelFromJson(Map<String, dynamic> json) => ImagesModel(
      imageUrl: json['file_url'] as String?,
      roomId: json['room_id'] as int?,
      hotelId: json['hotel_id'] as int?,
    );

Map<String, dynamic> _$ImagesModelToJson(ImagesModel instance) =>
    <String, dynamic>{
      'file_url': instance.imageUrl,
      'hotel_id': instance.hotelId,
      'room_id': instance.roomId,
    };
