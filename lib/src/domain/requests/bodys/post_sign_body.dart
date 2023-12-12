import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PostSignBody extends Equatable {
  const PostSignBody({
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
    this.gender,
  });
  final String email;
  final String name;
  final String password;
  final int phone;
  final bool? gender;
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'password': password,
      'phonenumber': phone,
      'gender': gender
    };
  }

  PostSignBody copyWith(
      {String? email,
      String? name,
      String? password,
      ValueGetter<int>? phone,
      bool? gender}) {
    return PostSignBody(
      email: email ?? this.email,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      password: password ?? this.password,
      phone: phone != null ? phone() : this.phone,
    );
  }

  @override
  String toString() {
    return 'PostSignBody(email: $email, name: $name, password: $password, phonenumber: $phone,gender: $gender)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, name, phone, gender];
}
