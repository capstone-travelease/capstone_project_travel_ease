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
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImagesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num?)?.toDouble(),
    )
      ..hotelAddress = json['hotel_address'] as String?
      ..hotelCountry = json['hotel_country'] as String?
      ..hotelDescription = json['hotel_description'] as String?
      ..facilities = (json['facilities'] as List<dynamic>?)
          ?.map((e) => FacilitiesModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$HotelModelToJson(HotelModel instance) =>
    <String, dynamic>{
      'hotel_id': instance.hotelId,
      'hotel_name': instance.hotelName,
      'hotel_address': instance.hotelAddress,
      'hotel_city': instance.hotelCity,
      'hotel_country': instance.hotelCountry,
      'hotel_description': instance.hotelDescription,
      'star_rating': instance.starRating,
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'price': instance.price,
      'facilities': instance.facilities?.map((e) => e.toJson()).toList(),
    };
