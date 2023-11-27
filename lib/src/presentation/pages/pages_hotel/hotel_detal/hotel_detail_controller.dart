import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailController extends GetxController {
  final activeIndex = 0.obs;
  final RxList<String> listImage = <String>[].obs;
  String fullText =
      'Khách sạn 5 sao là điểm đến hoàn hảo cho những người yêu thích sự sang trọng và dịch vụ tối ưu. Nơi đây đượng thiết kế với đẳng cấp và vẻ đẹp tối tân, từ kiến trúc đến nội thất. Khách sạn này cung cấp các dịch vụ cao cấp như nhà hàng 5 sao, spa, phòng tập thể dục, hồ bơi và quầy bar tại tầng thượng với tầm nhìn ấn tượng. Đội ngũ nhân viên luôn sẵn sàng phục vụ mọi nhu cầu của khách hàng, từ đón tiếp đến dịch vụ phòng hàng ngày. Tại đây, bạn sẽ tận hưởng kỳ nghỉ đáng nhớ trong không gian tuyệt vời và tiện nghi đỉnh cao.';

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
    loadData();
    super.onInit();
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
