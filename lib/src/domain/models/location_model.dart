import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationModel extends Equatable {
  const LocationModel({
    this.placeName,
    this.code,
  });
  @JsonKey(name: 'placeName')
  final String? placeName;
  @JsonKey(name: 'code')
  final int? code;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [placeName, code];
}
