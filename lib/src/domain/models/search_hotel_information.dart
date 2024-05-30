import 'package:flutter/material.dart';

class ArgSearchHotel {
  ArgSearchHotel({
    this.hotelId,
    required this.dateTimeRange,
    required this.location,
    required this.numberRoom,
    required this.numberAdult,
    this.hotelName,
  });
  DateTimeRange? dateTimeRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(
        const Duration(days: 1),
      ));
  String? location = '';
  int? numberRoom = 1;
  int? numberAdult = 2;
  final int? hotelId;
  final String? hotelName;
}
