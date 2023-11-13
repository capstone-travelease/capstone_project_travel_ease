import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model_search.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchModel {
  SearchModel(
      {this.location,
      this.numberRoom,
      this.numberAdult,
      this.todDay,
      this.fromDay});

  String? location;
  int? numberRoom;
  int? numberAdult;
  DateTime? todDay;
  DateTime? fromDay;
  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
