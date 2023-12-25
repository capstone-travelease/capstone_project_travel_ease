import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  UserModel({
    this.userId,
    this.email,
    this.phoneNumber,
    this.fullName,
    this.dob,
    this.gender,
    this.avatar,
    this.token,
  });
  @JsonKey(name: 'idUser')
  int? userId;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'avatar')
  String? avatar;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  @JsonKey(name: 'dob')
  DateTime? dob;
  @JsonKey(name: 'full_name')
  String? fullName;
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'gender')
  bool? gender;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
