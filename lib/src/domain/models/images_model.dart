import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'images_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ImagesModel extends Equatable {
  const ImagesModel({this.imageUrl, this.roomId, this.hotelId});
  @JsonKey(name: 'file_url')
  final String? imageUrl;
  @JsonKey(name: 'hotel_id')
  final int? hotelId;
  @JsonKey(name: 'room_id')
  final int? roomId;

  factory ImagesModel.fromJson(Map<String, dynamic> json) =>
      _$ImagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [imageUrl];
}
