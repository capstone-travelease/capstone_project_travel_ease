import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/src/domain/models/review_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  final RxList<ReviewModel> listReview = <ReviewModel>[].obs;
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  late int hotelId;
  @override
  void onInit() {
    hotelId = Get.arguments['hotelId'];
    fetchListReview();
    super.onInit();
  }

  Future<void> fetchListReview() async {
    try {
      final res = await _bookingService.reviewHotels(hotelId: hotelId);
      if (res.isEmpty) {
        listReview.call(null);
      } else {
        listReview.call(res);
      }
    } catch (error) {
      Get.log(
        error.toString(),
      );
    }
  }
}
