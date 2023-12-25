import 'package:equatable/equatable.dart';

class PostSearchHotelBody extends Equatable {
  const PostSearchHotelBody(
      {required this.location,
      required this.fromDate,
      required this.toDate,
      required this.adultNumber,
      required this.roomNumber,
      this.hotelName,
      this.priceFrom,
      this.toPrice,
      this.ratting,
      this.facilities,
      this.priceFromHighToLow,
      this.priceFromLowToHigh});
  final String location;
  final DateTime fromDate;
  final DateTime toDate;
  final int roomNumber;
  final int adultNumber;
  final String? hotelName;
  final int? priceFrom;
  final int? toPrice;
  final int? ratting;
  final List<String>? facilities;
  final bool? priceFromLowToHigh;
  final bool? priceFromHighToLow;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'location': location,
      'fromDate': fromDate.toIso8601String(),
      'toDate': toDate.toIso8601String(),
      'roomNumber': roomNumber,
      'adultNumber': adultNumber,
      'hotelName': hotelName,
      'priceFrom': priceFrom,
      'toPrice': toPrice,
      'ratting': ratting,
      'facilities': facilities,
      'priceFromLowToHigh': priceFromLowToHigh,
      'priceFromHighToLow': priceFromHighToLow,
    };
  }

  PostSearchHotelBody copyWith({
    String? location,
    DateTime? fromDate,
    DateTime? toDate,
    int? roomNumber,
    int? adultNumber,
    String? hotelName,
    int? priceFrom,
    int? toPrice,
    int? ratting,
    List<String>? facilities,
    bool? priceFromLowToHigh,
    bool? priceFromHighToLow,
  }) {
    return PostSearchHotelBody(
      location: location ?? this.location,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      adultNumber: adultNumber ?? this.adultNumber,
      roomNumber: roomNumber ?? this.roomNumber,
      hotelName: hotelName ?? this.hotelName,
      toPrice: toPrice ?? this.toPrice,
      facilities: facilities ?? this.facilities,
      priceFrom: priceFrom ?? this.priceFrom,
      priceFromHighToLow: priceFromHighToLow ?? this.priceFromHighToLow,
      priceFromLowToHigh: priceFromLowToHigh ?? this.priceFromLowToHigh,
    );
  }

  @override
  String toString() {
    return 'PostSearchHotelBody('
        'location: $location, fromDate: $fromDate, toDate: $toDate, roomNumber: $roomNumber,adultNumber: $adultNumber,hotelName: $hotelName, toPrice: $toPrice, facilities: $facilities, priceFrom: $priceFrom, priceFromHighToLow: $priceFromHighToLow,, priceFromLowToHigh: $priceFromLowToHigh)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
