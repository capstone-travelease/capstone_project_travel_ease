import 'package:json_annotation/json_annotation.dart';
part 'model_search.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchModel {
  SearchModel({
    this.location,
    this.numberRoom,
    this.numberAdult,
    this.todDay,
    this.fromDay,
    this.hotelName,
    this.priceFrom,
    this.toPrice,
    this.ratting,
    this.facilities,
    this.priceFromLowToHigh,
    this.priceFromHighToLow,
  });

  String? location;
  int? numberRoom;
  int? numberAdult;
  DateTime? todDay;
  DateTime? fromDay;
  String? hotelName;
  int? priceFrom;
  int? toPrice;
  int? ratting;
  List<String>? facilities;
  bool? priceFromLowToHigh;
  bool? priceFromHighToLow;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
