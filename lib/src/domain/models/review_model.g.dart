// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      fullName: json['fullName'] as String?,
      dateReview: json['dateReview'] == null
          ? null
          : DateTime.parse(json['dateReview'] as String),
      content: json['content'] as String?,
      starRating: (json['starRating'] as num?)?.toDouble(),
      imageUser: json['imageUser'] as String?,
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'dateReview': instance.dateReview?.toIso8601String(),
      'content': instance.content,
      'starRating': instance.starRating,
      'imageUser': instance.imageUser,
    };
