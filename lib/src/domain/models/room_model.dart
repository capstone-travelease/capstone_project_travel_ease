import 'package:capstone_project_travel_ease/src/domain/models/facilities_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/images_model.dart';
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
      this.images,
      this.facilities});
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
  @JsonKey(name: 'images')
  List<ImagesModel>? images;
  @JsonKey(name: 'facilities')
  List<FacilitiesModel>? facilities;
  @JsonKey(name: 'room_price')
  double? roomPrice;
  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
