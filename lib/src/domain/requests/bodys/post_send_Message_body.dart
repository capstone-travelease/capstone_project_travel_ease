import 'package:equatable/equatable.dart';

class PostSendMessageBody extends Equatable {
  const PostSendMessageBody({
    this.senderId,
    this.targetId,
    this.message,
  });
  final int? senderId;
  final int? targetId;
  final String? message;

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'targetId': targetId,
      'message': message,
    };
  }

  PostSendMessageBody copyWith({
    int? senderId,
    int? targetId,
    String? message,
  }) {
    return PostSendMessageBody(
      targetId: targetId ?? this.targetId,
      senderId: senderId ?? this.senderId,
      message: message ?? this.message,
    );
  }

  @override
  String toString() =>
      'PostSendMessageBody(senderId: $senderId, targetId: $targetId, message: $message)';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
