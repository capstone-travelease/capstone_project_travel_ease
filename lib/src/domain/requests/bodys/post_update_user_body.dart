import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PostUpdateUserBody extends Equatable {
  const PostUpdateUserBody({
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
    this.gender,
    this.birthday,
  });
  final String email;
  final String name;
  final String password;
  final int phone;
  final DateTime? birthday;
  final bool? gender;
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'password': password,
      'phonenumber': phone,
      'gender': gender,
      'birthday': birthday,
    };
  }

  PostUpdateUserBody copyWith(
      {String? email,
      String? name,
      String? password,
      ValueGetter<int>? phone,
      DateTime? birthday,
      bool? gender}) {
    return PostUpdateUserBody(
        email: email ?? this.email,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        password: password ?? this.password,
        phone: phone != null ? phone() : this.phone,
        birthday: birthday ?? this.birthday);
  }

  @override
  String toString() {
    return 'PostUpdateUserBody(email: $email, name: $name, password: $password, phonenumber: $phone,gender: $gender,birthday: $birthday)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, name, phone, gender, birthday];
}
