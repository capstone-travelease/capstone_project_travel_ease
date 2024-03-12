import 'package:equatable/equatable.dart';

class PostSendMessageBody extends Equatable {
  const PostSendMessageBody({
    this.senderName,
    this.targetUserName,
    this.message,
  });
  final String? senderName;
  final String? targetUserName;
  final String? message;

  Map<String, dynamic> toJson() {
    return {
      'senderName': senderName,
      'targetUserName': targetUserName,
      'message': message,
    };
  }

  PostSendMessageBody copyWith({
    String? senderName,
    String? targetUserName,
    String? message,
  }) {
    return PostSendMessageBody(
      senderName: senderName ?? this.senderName,
      targetUserName: targetUserName ?? this.targetUserName,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'PostSendMessageBody(senderName: $senderName, targetUserName: $targetUserName, message: $message)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
