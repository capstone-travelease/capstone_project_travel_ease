import 'package:equatable/equatable.dart';

class GetMessageBody extends Equatable {
  const GetMessageBody({
    this.senderName,
    this.targetName,
  });
  final String? senderName;
  final String? targetName;

  Map<String, dynamic> toJson() {
    return {
      'senderName': senderName,
      'targetName': targetName,
    };
  }

  GetMessageBody copyWith({
    String? senderName,
    String? targetName,
  }) {
    return GetMessageBody(
      senderName: senderName ?? this.senderName,
      targetName: targetName ?? this.targetName,
    );
  }

  @override
  String toString() {
    return 'GetMessageBody(senderName: $senderName, targetName: $targetName)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
