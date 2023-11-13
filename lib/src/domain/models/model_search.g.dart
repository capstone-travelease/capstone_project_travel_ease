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
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'numberRoom': instance.numberRoom,
      'numberAdult': instance.numberAdult,
      'todDay': instance.todDay?.toIso8601String(),
      'fromDay': instance.fromDay?.toIso8601String(),
    };
