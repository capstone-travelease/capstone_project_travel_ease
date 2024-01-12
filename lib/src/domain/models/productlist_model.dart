import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'productlist_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductListModel extends Equatable {
  const ProductListModel({this.roomName, this.maxGuest, this.numberRoom});
  @JsonKey(name: 'roomName')
  final String? roomName;
  @JsonKey(name: 'maxGuest')
  final int? maxGuest;
  @JsonKey(name: 'numberRoom')
  final int? numberRoom;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        roomName,
        maxGuest,
        numberRoom,
      ];
}
