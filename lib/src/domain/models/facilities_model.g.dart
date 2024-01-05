// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facilities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilitiesModel _$FacilitiesModelFromJson(Map<String, dynamic> json) =>
    FacilitiesModel(
      json['facility_image'] as String?,
      facilityId: json['facility_id'] as int?,
      facilityName: json['facility_name'] as String?,
      hotelId: json['hotel_id'] as int?,
    );

Map<String, dynamic> _$FacilitiesModelToJson(FacilitiesModel instance) =>
    <String, dynamic>{
      'facility_id': instance.facilityId,
      'facility_name': instance.facilityName,
      'facility_image': instance.facilityImage,
      'hotel_id': instance.hotelId,
    };
