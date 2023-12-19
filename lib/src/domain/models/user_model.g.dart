// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['idUser'] as int?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      fullName: json['full_name'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      gender: json['gender'] as bool?,
      avatar: json['avatar'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'idUser': instance.userId,
      'email': instance.email,
      'avatar': instance.avatar,
      'phone_number': instance.phoneNumber,
      'dob': instance.dob?.toIso8601String(),
      'full_name': instance.fullName,
      'token': instance.token,
      'gender': instance.gender,
    };
