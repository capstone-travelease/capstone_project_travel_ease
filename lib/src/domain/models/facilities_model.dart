import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facilities_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FacilitiesModel extends Equatable {
  const FacilitiesModel({this.facilityId, this.facilityName, this.hotelId});
  @JsonKey(name: 'facility_id')
  final int? facilityId;
  @JsonKey(name: 'facility_name')
  final String? facilityName;
  @JsonKey(name: 'hotel_id')
  final int? hotelId;

  factory FacilitiesModel.fromJson(Map<String, dynamic> json) =>
      _$FacilitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$FacilitiesModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [facilityName];
}
