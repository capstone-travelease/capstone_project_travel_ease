// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelModel _$HotelModelFromJson(Map<String, dynamic> json) => HotelModel(
      hotelId: json['hotel_id'] as int?,
      hotelName: json['hotel_name'] as String?,
      hotelCity: json['hotel_city'] as String?,
      starRating: (json['star_rating'] as num?)?.toDouble(),
      images: json['images'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HotelModelToJson(HotelModel instance) =>
    <String, dynamic>{
      'hotel_id': instance.hotelId,
      'hotel_name': instance.hotelName,
      'hotel_city': instance.hotelCity,
      'star_rating': instance.starRating,
      'images': instance.images,
      'price': instance.price,
    };
