import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/src/domain/models/facilities_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 50000000.0.obs;
  List<int> dsStar = [5, 4, 3, 2, 1];
  final Rxn<int> selectedStar = Rxn();
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  RxList<FacilitiesModel> facilitiesList = <FacilitiesModel>[].obs;
  final RxList<FacilitiesModel> selectedFacilities = <FacilitiesModel>[].obs;
  @override
  void onInit() {
    selectStar(dsStar.first);
    fetchListBankAccount();
    super.onInit();
  }

// Function to update the price range
  void updatePriceRange(double min, double max) {
    minPrice.value = min;
    maxPrice.value = max;
  }

  void selectStar(int? value) {
    if (selectedStar.value != value) {
      selectedStar.call(value);
      return;
    }
  }

  Future<void> fetchListBankAccount() async {
    try {
      final res = await _bookingService.listFacilities();
      facilitiesList.call(res);
    } catch (error) {
      Get.log(error.toString());
    }
  }

  void selectListFacilities(FacilitiesModel value) {
    if (!selectedFacilities.contains(value)) {
      selectedFacilities.add(value);
    } else {
      selectedFacilities.remove(value);
    }
  }
}
