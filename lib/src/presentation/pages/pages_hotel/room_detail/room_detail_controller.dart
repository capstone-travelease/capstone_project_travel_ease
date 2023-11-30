import 'package:get/get.dart';

class RoomDetailController extends GetxController {
  final activeIndex = 0.obs;
  late int roomId;
  final RxList<String> listImage = <String>[].obs;
  String fullText =
      'Khách sạn 5 sao là điểm đến hoàn hảo cho những người yêu thích sự sang trọng và dịch vụ tối ưu. Nơi đây đượng thiết kế với đẳng cấp và vẻ đẹp tối tân, từ kiến trúc đến nội thất. Khách sạn này cung cấp các dịch vụ cao cấp như nhà hàng 5 sao, spa, phòng tập thể dục, hồ bơi và quầy bar tại tầng thượng với tầm nhìn ấn tượng. Đội ngũ nhân viên luôn sẵn sàng phục vụ mọi nhu cầu của khách hàng, từ đón tiếp đến dịch vụ phòng hàng ngày. Tại đây, bạn sẽ tận hưởng kỳ nghỉ đáng nhớ trong không gian tuyệt vời và tiện nghi đỉnh cao.';
  final isExpanded = false.obs;
  List<String> dsImage = [
    'https://www.hotelgrandsaigon.com/wp-content/uploads/sites/227/2017/12/GRAND_SEDK_01.jpg',
    'https://images.squarespace-cdn.com/content/v1/5aadf482aa49a1d810879b88/1626698419120-J7CH9BPMB2YI728SLFPN/1.jpg',
    'https://asiky.com/files/images/Article/tin-tuc/chup-anh-khach-san.jpg',
    'https://cf.bstatic.com/xdata/images/hotel/max1024x768/382586584.jpg?k=c615c33d39628661129df3581cdf4eacc434cccdd69ed4fc62be839d28f526af&o=&hp=1'
  ];
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
}
