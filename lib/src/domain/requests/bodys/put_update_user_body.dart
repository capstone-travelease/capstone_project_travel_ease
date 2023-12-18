import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PutUpdateUserBody extends Equatable {
  const PutUpdateUserBody({
    this.avatar,
    required this.phone,
    required this.fullname,
    this.gender,
    this.birthday,
  });
  final String fullname;
  final String? avatar;
  final String phone;
  final DateTime? birthday;
  final bool? gender;
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fullname': fullname,
      'avatar': avatar,
      'phone': phone,
      'gender': gender,
      'birthday': birthday?.toIso8601String(),
    };
  }

  PutUpdateUserBody copyWith(
      {String? email,
      String? fullname,
      String? avatar,
      String? phone,
      DateTime? birthday,
      bool? gender}) {
    return PutUpdateUserBody(
        fullname: fullname ?? this.fullname,
        gender: gender ?? this.gender,
        avatar: avatar ?? this.avatar,
        phone: phone ?? this.phone,
        birthday: birthday ?? this.birthday);
  }

  @override
  String toString() {
    return 'PutUpdateUserBody( fullname: $fullname, avatar: $avatar, phonenumber: $phone,gender: $gender,birthday: $birthday)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [fullname, phone, gender, birthday];
}
