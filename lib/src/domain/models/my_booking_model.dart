import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_booking_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MyBookingModel extends Equatable {
  const MyBookingModel({
    this.bookingId,
    this.hotelId,
    this.hotelName,
    this.hotelAddress,
    this.hotelCity,
    this.fileUrl,
    this.bookingStatus,
    this.ratePoint,
  });
  @JsonKey(name: 'bookingId')
  final int? bookingId;
  @JsonKey(name: 'hotelId')
  final int? hotelId;
  @JsonKey(name: 'hotelName')
  final String? hotelName;
  @JsonKey(name: 'hotelAddress')
  final String? hotelAddress;
  @JsonKey(name: 'bookingStatus')
  final String? bookingStatus;
  @JsonKey(name: 'fileUrl')
  final String? fileUrl;
  @JsonKey(name: 'ratePoint')
  final double? ratePoint;
  @JsonKey(name: 'hotelCity')
  final String? hotelCity;

  factory MyBookingModel.fromJson(Map<String, dynamic> json) =>
      _$MyBookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyBookingModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        bookingId,
        hotelId,
        hotelName,
        hotelAddress,
        fileUrl,
        ratePoint,
        bookingStatus,
        hotelCity,
      ];
}
