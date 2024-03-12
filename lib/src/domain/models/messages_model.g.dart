// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesModel _$MessagesModelFromJson(Map<String, dynamic> json) =>
    MessagesModel(
      messageId: json['messageId'] as int?,
      senderName: json['senderName'] as String?,
      targetUserName: json['targetUserName'] as String?,
      message: json['message'] as String?,
      date:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$MessagesModelToJson(MessagesModel instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'senderName': instance.senderName,
      'targetUserName': instance.targetUserName,
      'message': instance.message,
      'time': instance.date?.toIso8601String(),
    };
