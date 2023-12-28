import 'package:equatable/equatable.dart';

class PutUpdateUserBody extends Equatable {
  const PutUpdateUserBody({
    required this.phone,
    required this.fullName,
    this.gender,
    this.birthday,
  });
  final String fullName;
  final String phone;
  final DateTime? birthday;
  final bool? gender;
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fullname': fullName,
      'phone': phone,
      'gender': gender,
      'birthday': birthday?.toIso8601String(),
    };
  }

  PutUpdateUserBody copyWith(
      {String? email,
      String? fullname,
      String? phone,
      DateTime? birthday,
      bool? gender}) {
    return PutUpdateUserBody(
        fullName: fullname ?? this.fullName,
        gender: gender ?? this.gender,
        phone: phone ?? this.phone,
        birthday: birthday ?? this.birthday);
  }

  @override
  String toString() {
    return 'PutUpdateUserBody( fullname: $fullName, phonenumber: $phone,gender: $gender,birthday: $birthday)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [fullName, phone, gender, birthday];
}
