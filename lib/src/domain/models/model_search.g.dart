// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      location: json['location'] as String?,
      numberRoom: json['numberRoom'] as int?,
      numberAdult: json['numberAdult'] as int?,
      todDay: json['todDay'] == null
          ? null
          : DateTime.parse(json['todDay'] as String),
      fromDay: json['fromDay'] == null
          ? null
          : DateTime.parse(json['fromDay'] as String),
      hotelName: json['hotelName'] as String?,
      priceFrom: json['priceFrom'] as int?,
      toPrice: json['toPrice'] as int?,
      ratting: json['ratting'] as int?,
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      priceFromLowToHigh: json['priceFromLowToHigh'] as bool?,
      priceFromHighToLow: json['priceFromHighToLow'] as bool?,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'numberRoom': instance.numberRoom,
      'numberAdult': instance.numberAdult,
      'todDay': instance.todDay?.toIso8601String(),
      'fromDay': instance.fromDay?.toIso8601String(),
      'hotelName': instance.hotelName,
      'priceFrom': instance.priceFrom,
      'toPrice': instance.toPrice,
      'ratting': instance.ratting,
      'facilities': instance.facilities,
      'priceFromLowToHigh': instance.priceFromLowToHigh,
      'priceFromHighToLow': instance.priceFromHighToLow,
    };
