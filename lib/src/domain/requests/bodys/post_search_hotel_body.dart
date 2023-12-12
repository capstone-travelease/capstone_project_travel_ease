import 'package:equatable/equatable.dart';

class PostSearchHotelBody extends Equatable {
  const PostSearchHotelBody(
      {required this.location,
      required this.fromDate,
      required this.toDate,
      required this.numberAdult,
      required this.numberRoom,
      this.hotelName,
      this.priceFrom,
      this.toPrice,
      this.ratting,
      this.facilities,
      this.priceFromHighToLow,
      this.priceFromLowToHigh});
  final String location;
  final DateTime fromDate;
  final String toDate;
  final int numberRoom;
  final bool numberAdult;
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
      'fromDate': fromDate,
      'toDate': toDate,
      'numberRoom': numberRoom,
      'numberAdult': numberAdult,
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
    String? toDate,
    int? numberRoom,
    bool? numberAdult,
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
      numberAdult: numberAdult ?? this.numberAdult,
      numberRoom: numberRoom ?? this.numberRoom,
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
        'location: $location, fromDate: $fromDate, toDate: $toDate, numberAdult: $numberAdult,numberRoom: $numberRoom,hotelName: $hotelName, toPrice: $toPrice, facilities: $facilities, priceFrom: $priceFrom, priceFromHighToLow: $priceFromHighToLow,, priceFromLowToHigh: $priceFromLowToHigh)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
