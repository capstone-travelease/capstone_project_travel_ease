// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesModel _$MessagesModelFromJson(Map<String, dynamic> json) =>
    MessagesModel(
      messageId: json['messageId'] as int?,
      senderId: json['senderId'] as int?,
      targetId: json['targetId'] as int?,
      message: json['message'] as String?,
      date:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$MessagesModelToJson(MessagesModel instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'targetId': instance.targetId,
      'message': instance.message,
      'time': instance.date?.toIso8601String(),
    };
