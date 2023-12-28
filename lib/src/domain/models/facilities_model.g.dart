// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facilities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilitiesModel _$FacilitiesModelFromJson(Map<String, dynamic> json) =>
    FacilitiesModel(
      facilityId: json['facility_id'] as int?,
      facilityName: json['facility_name'] as String?,
      hotelId: json['hotel_id'] as int?,
    );

Map<String, dynamic> _$FacilitiesModelToJson(FacilitiesModel instance) =>
    <String, dynamic>{
      'facility_id': instance.facilityId,
      'facility_name': instance.facilityName,
      'hotel_id': instance.hotelId,
    };
