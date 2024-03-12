import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'messages_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MessagesModel extends Equatable {
  const MessagesModel({
    this.messageId,
    this.senderName,
    this.targetUserName,
    this.message,
    this.date,
  });

  @JsonKey(name: 'messageId')
  final int? messageId;
  @JsonKey(name: 'senderName')
  final String? senderName;
  @JsonKey(name: 'targetUserName')
  final String? targetUserName;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'time')
  final DateTime? date;

  factory MessagesModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessagesModelToJson(this);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
