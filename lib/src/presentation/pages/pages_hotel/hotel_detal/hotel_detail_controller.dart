import 'package:capstone_project_travel_ease/core/constrants/Constant.dart';
import 'package:capstone_project_travel_ease/src/domain/models/hotel_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailController extends GetxController {
  final activeIndex = 0.obs;
  final RxList<String> listImage = <String>[].obs;
  late int hotelId;
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  final Rxn<HotelModel> hotelDetail = Rxn<HotelModel>();
  List<String> dsImage = [
    'https://www.hotelgrandsaigon.com/wp-content/uploads/sites/227/2017/12/GRAND_SEDK_01.jpg',
    'https://images.squarespace-cdn.com/content/v1/5aadf482aa49a1d810879b88/1626698419120-J7CH9BPMB2YI728SLFPN/1.jpg',
    'https://asiky.com/files/images/Article/tin-tuc/chup-anh-khach-san.jpg',
    'https://cf.bstatic.com/xdata/images/hotel/max1024x768/382586584.jpg?k=c615c33d39628661129df3581cdf4eacc434cccdd69ed4fc62be839d28f526af&o=&hp=1'
  ];
  final showItems = 0.obs;
  final isExpanded = false.obs;
  final RxBool _isLoading = RxBool(false);
  bool showPermitAfterSearch = true;
  set isLoading(bool value) {
    _isLoading.value = value;
  }

  @override
  void onInit() {
    hotelId = Get.arguments['hotelId'];
    loadData();
    fetchRoomDetail();
    super.onInit();
  }

  Future<void> fetchRoomDetail() async {
    try {
      final res = await _bookingService.detailHotel(hotelId: hotelId);
      hotelDetail.call(res);
    } catch (e) {
      Get.log(e.toString());
    }
  }

  Future<void> loadData() async {
    listImage.call(dsImage);
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

  @override
  void onClose() {
    super.onClose();
  }
}
