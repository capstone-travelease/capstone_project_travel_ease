import 'package:equatable/equatable.dart';

class PostPaymentBody extends Equatable {
  const PostPaymentBody({
    required this.hotelId,
    required this.roomId,
    required this.fromDate,
    required this.toDate,
    required this.numberAdult,
    required this.numberRoom,
    this.userId,
    this.phone,
    this.fullName,
    this.note,
    required this.totalAmount,
  });
  final int hotelId;
  final int roomId;
  final int? userId;
  final String? fullName;
  final int? phone;
  final DateTime fromDate;
  final String toDate;
  final int numberRoom;
  final bool numberAdult;
  final int totalAmount;
  final String? note;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
