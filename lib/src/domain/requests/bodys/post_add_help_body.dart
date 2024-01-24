import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PostAddHelpBody extends Equatable {
  const PostAddHelpBody({
    required this.email,
    required this.name,
    required this.contactNumber,
    required this.noiDung,
    this.ticket,
  });
  final int? ticket;
  final String name;
  final int contactNumber;
  final String email;
  final String? noiDung;
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'contactNumber': contactNumber,
      'noiDung': noiDung,
      'ticket': ticket,
    };
  }

  PostAddHelpBody copyWith({
    String? email,
    String? name,
    String? noiDung,
    ValueGetter<int>? contactNumber,
    int? ticket,
  }) {
    return PostAddHelpBody(
      email: email ?? this.email,
      name: name ?? this.name,
      noiDung: noiDung ?? this.noiDung,
      ticket: ticket ?? this.ticket,
      contactNumber:
          contactNumber != null ? contactNumber() : this.contactNumber,
    );
  }

  @override
  String toString() {
    return 'PostAddHelpBody(email: $email, name: $name, noiDung: $noiDung, contactNumber: $contactNumber,ticket: $ticket)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, name, contactNumber, ticket, noiDung];
}
