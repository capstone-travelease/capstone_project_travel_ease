import 'package:equatable/equatable.dart';

class GetMessageBody extends Equatable {
  const GetMessageBody({
    this.senderId,
    this.targetId,
  });
  final int? senderId;
  final int? targetId;

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'targetId': targetId,
    };
  }

  GetMessageBody copyWith({
    int? senderId,
    int? targetId,
  }) {
    return GetMessageBody(
      senderId: senderId ?? this.senderId,
      targetId: targetId ?? this.targetId,
    );
  }

  @override
  String toString() =>
      'GetMessageBody(senderId: $senderId, targetId: $targetId)';
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
