import 'package:equatable/equatable.dart';

class GetMyBookingBody extends Equatable {
  const GetMyBookingBody({
    required this.userId,
    required this.statusName,
  });
  final int userId;
  final String statusName;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'statusName': statusName,
    };
  }

  GetMyBookingBody copyWith({
    int? userId,
    String? statusName,
  }) {
    return GetMyBookingBody(
      userId: userId ?? this.userId,
      statusName: statusName ?? this.statusName,
    );
  }

  @override
  String toString() {
    return 'GetMyBookingBody(userId: $userId, statusName: $statusName,)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        statusName,
      ];
}
