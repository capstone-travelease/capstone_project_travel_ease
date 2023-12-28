import 'package:capstone_project_travel_ease/src/domain/models/facilities_model.dart';
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
  @JsonKey(name: 'hotel_address')
  String? hotelAddress;
  @JsonKey(name: 'hotel_city')
  String? hotelCity;
  @JsonKey(name: 'hotel_country')
  String? hotelCountry;
  @JsonKey(name: 'hotel_description')
  String? hotelDescription;
  @JsonKey(name: 'star_rating')
  double? starRating;
  @JsonKey(name: 'hotel_images')
  String? images;
  @JsonKey(name: 'price')
  double? price;
  @JsonKey(name: 'facilities')
  List<FacilitiesModel>? facilities;

  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelModelToJson(this);
}
