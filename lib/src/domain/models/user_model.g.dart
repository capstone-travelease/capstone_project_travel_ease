// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['idUser'] as int?,
      email: json['email'] as String?,
      phone_number: json['phone_number'] as String?,
      full_name: json['full_name'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as bool?,
      avatar: json['avatar'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'idUser': instance.userId,
      'email': instance.email,
      'avatar': instance.avatar,
      'phone_number': instance.phone_number,
      'dob': instance.dob?.toIso8601String(),
      'full_name': instance.full_name,
      'token': instance.token,
      'gender': instance.gender,
    };
