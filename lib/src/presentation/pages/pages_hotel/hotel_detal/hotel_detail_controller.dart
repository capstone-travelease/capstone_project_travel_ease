import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/src/domain/models/hotel_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/search_hotel_information.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailController extends GetxController {
  final activeIndex = 0.obs;

  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  final Rxn<HotelModel> hotelDetail = Rxn<HotelModel>();

  final showItems = 0.obs;
  final isExpanded = false.obs;
  final RxBool _isLoading = RxBool(false);
  bool showPermitAfterSearch = true;
  set isLoading(bool value) {
    _isLoading.value = value;
  }

  late ArgSearchHotel argHotelDetail;
  @override
  void onInit() {
    argHotelDetail = Get.arguments as ArgSearchHotel;
    fetchRoomDetail();
    super.onInit();
  }

  Future<void> fetchRoomDetail() async {
    try {
      final res =
          await _bookingService.detailHotel(hotelId: argHotelDetail.hotelId!);
      hotelDetail.call(res);
    } catch (e) {
      Get.log(e.toString());
    }
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  // The current location of the map.
  LatLng _currentLocation = const LatLng(10.794670, 106.709151);

  // The zoom level of the map.
  final double _zoomLevel = 15.5;

  // Getters for the current location, zoom level, and markers.
  LatLng get currentLocation => _currentLocation;
  double get zoomLevel => _zoomLevel;

  // Setters for the current location, zoom level, and markers.
  set currentLocation(LatLng location) {
    _currentLocation = location;
    update();
  }

  void openGoogleMapsApp(double latitude, double longitude) async {
    final String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
      await launchUrl(Uri.parse(googleMapsUrl));
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}
