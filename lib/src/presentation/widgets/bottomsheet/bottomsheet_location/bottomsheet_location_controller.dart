import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/src/domain/models/location_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:get/get.dart';

class BottomSheetLocationController extends GetxController {
  BottomSheetLocationController({
    LocationModel? initialValue,
  }) {
    selectedLocation.value = initialValue;
  }
  final Rxn<LocationModel> selectedLocation = Rxn();
  final RxList<LocationModel> listLocation = <LocationModel>[].obs;
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  final RxBool isLoading = true.obs;
  @override
  void onInit() {
    searchData(keySearch: '');
    super.onInit();
  }

  Future<void> searchData(
      {required String keySearch, bool refresh = false}) async {
    try {
      final res = await _bookingService.getLocation(keySearch);
      res.sort((a, b) => (a.placeName ?? '').compareTo((b.placeName ?? '')));
      listLocation.call(res);
    } catch (error) {
      Get.log(error.toString());
    }
    isLoading.call(false);
  }

  void selectLocation(LocationModel? value) {
    if (selectedLocation.value != value) {
      selectedLocation.call(value);
      Get.back(result: selectedLocation.value);
      return;
    }
    selectedLocation.value = null;
  }
}
