// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as int?,
      email: json['email'] as String?,
      phone: json['phone'] as int?,
      name: json['name'] as String?,
      gender: json['gender'] as bool?,
      password: json['password'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'name': instance.name,
      'token': instance.token,
      'gender': instance.gender,
    };
