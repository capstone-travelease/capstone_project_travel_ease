import 'package:capstone_project_travel_ease/src/domain/models/productlist_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_ticket_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookingTicketModel extends Equatable {
  const BookingTicketModel({
    this.ticketId,
    this.hotelId,
    this.hotelName,
    this.hotelCity,
    this.fileUrl,
    this.userName,
    this.userEmail,
    this.userPhone,
    this.checkOutDate,
    this.checkInDate,
    this.productList,
    this.paymentMethod,
    this.totalPrice,
    this.ownerId,
  });
  @JsonKey(name: 'ticketId')
  final int? ticketId;
  @JsonKey(name: 'hotelId')
  final int? hotelId;
  @JsonKey(name: 'hotelName')
  final String? hotelName;
  @JsonKey(name: 'hotelCity')
  final String? hotelCity;
  @JsonKey(name: 'userName')
  final String? userName;
  @JsonKey(name: 'fileUrl')
  final String? fileUrl;
  @JsonKey(name: 'userEmail')
  final String? userEmail;
  @JsonKey(name: 'userPhone')
  final String? userPhone;
  @JsonKey(name: 'checkInDate')
  final DateTime? checkInDate;
  @JsonKey(name: 'checkOutDate')
  final DateTime? checkOutDate;
  @JsonKey(name: 'productList')
  final List<ProductListModel>? productList;
  @JsonKey(name: 'paymentMethod')
  final String? paymentMethod;
  @JsonKey(name: 'totalPrice')
  final int? totalPrice;
  @JsonKey(name: 'ownerId')
  final int? ownerId;

  factory BookingTicketModel.fromJson(Map<String, dynamic> json) =>
      _$BookingTicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingTicketModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        hotelName,
        hotelId,
        hotelCity,
        fileUrl,
        userEmail,
        userPhone,
        userName,
        totalPrice,
        productList,
        paymentMethod,
        checkInDate,
        checkOutDate,
      ];
}
