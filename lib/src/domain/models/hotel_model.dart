import 'package:json_annotation/json_annotation.dart';

part 'hotel_model.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelModel {
  HotelModel({
    this.hotelId,
    this.hotelName,
    this.hotelCity,
    this.starRating,
    this.images,
    this.price,
  });
  @JsonKey(name: 'hotel_id')
  int? hotelId;
  @JsonKey(name: 'hotel_name')
  String? hotelName;
  @JsonKey(name: 'hotel_city')
  String? hotelCity;
  @JsonKey(name: 'star_rating')
  double? starRating;
  @JsonKey(name: 'images')
  String? images;
  @JsonKey(name: 'price')
  double? price;

  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelModelToJson(this);
}
