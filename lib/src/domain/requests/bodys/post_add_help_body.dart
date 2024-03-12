import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PostAddHelpBody extends Equatable {
  const PostAddHelpBody({
    required this.bookingState,
    required this.email,
    required this.fullName,
    required this.contactNumber,
    required this.noiDung,
    this.ticketId,
  });
  final bool? bookingState;
  final int? ticketId;
  final String fullName;
  final int contactNumber;
  final String email;
  final String? noiDung;
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'bookingState': bookingState,
      'ticketId': ticketId,
      'email': email,
      'userName': fullName,
      'contactNumber': contactNumber,
      'messages': noiDung,
    };
  }

  PostAddHelpBody copyWith({
    bool? bookingState,
    String? email,
    String? fullName,
    String? noiDung,
    ValueGetter<int>? contactNumber,
    int? ticketId,
  }) {
    return PostAddHelpBody(
      bookingState: bookingState ?? this.bookingState,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      noiDung: noiDung ?? this.noiDung,
      ticketId: ticketId ?? this.ticketId,
      contactNumber:
          contactNumber != null ? contactNumber() : this.contactNumber,
    );
  }

  @override
  String toString() {
    return 'PostAddHelpBody(email: $email, fullName: $fullName, noiDung: $noiDung, contactNumber: $contactNumber,ticketId: $ticketId)';
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [email, fullName, contactNumber, ticketId, noiDung];
}
