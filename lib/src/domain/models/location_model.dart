import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationModel {
  LocationModel({
    this.placeName,
    this.code,
  });
  @JsonKey(name: 'placeName')
  String? placeName;
  @JsonKey(name: 'code')
  int? code;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
