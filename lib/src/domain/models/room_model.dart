import 'package:json_annotation/json_annotation.dart';

part 'room_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RoomModel {
  RoomModel(
      {this.roomId,
      this.roomName,
      this.roomDescription,
      this.roomSize,
      this.roomBedQuantity,
      this.roomCapacity,
      this.roomPrice,
      this.fileUrl,
      this.facilityName});
  @JsonKey(name: 'room_id')
  int? roomId;
  @JsonKey(name: 'room_name')
  String? roomName;
  @JsonKey(name: 'room_description')
  String? roomDescription;
  @JsonKey(name: 'room_size')
  String? roomSize;
  @JsonKey(name: 'room_bed_quantity')
  int? roomBedQuantity;
  @JsonKey(name: 'room_capacity')
  int? roomCapacity;
  @JsonKey(name: 'file_url')
  String? fileUrl;
  @JsonKey(name: 'facility_name')
  String? facilityName;
  @JsonKey(name: 'room_price')
  double? roomPrice;
  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}