import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  UserModel({
    this.userId,
    this.email,
    this.phone,
    this.name,
    this.gender,
    this.password,
  });
  @JsonKey(name: 'userId')
  int? userId;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'phone')
  int? phone;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'gender')
  bool? gender;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
