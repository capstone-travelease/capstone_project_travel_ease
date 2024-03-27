import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/src/domain/models/facilities_model.dart';
import 'package:capstone_project_travel_ease/src/domain/models/model_search.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  FilterController({
    double? initialValueMinPrice,
    double? initialValueMaxPrice,
    int? initialValueStar,
    List<String>? initialValueFacilities,
    String? initialSortLowValue,
    String? initialSortHighValue,
  }) {
    minPrice.value = initialValueMinPrice ?? 0.0;
    maxPrice.value = initialValueMaxPrice ?? 50000000.0;
    selectedStar.value = initialValueStar;
    selectedFacilities.value = initialValueFacilities ?? <String>[];
    if (initialSortLowValue == 'From low to high') {
      selectedSortPrice.value = initialSortLowValue;
    } else if (initialSortHighValue == 'From high to low') {
      selectedSortPrice.value = initialSortHighValue;
    }
  }

  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 50000000.0.obs;
  List<int> dsStar = [5, 4, 3, 2, 1];
  List<String> sortPrice = ['From low to high', 'From high to low'];
  final Rxn<String> selectedSortPrice = Rxn();
  final Rxn<int> selectedStar = Rxn();
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  RxList<FacilitiesModel> facilitiesList = <FacilitiesModel>[].obs;
  final RxList<String> selectedFacilities = <String>[].obs;
  @override
  void onInit() {
    // selectStar(dsStar.first);
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

  void selectSortPrice(String? value) {
    if (selectedSortPrice.value != value) {
      selectedSortPrice.call(value);

      if (selectedSortPrice.value == 'From high to low') {
        final searchModel = SearchModel(
          priceFromHighToLow: true,
          priceFromLowToHigh: false,
        );
        Get.back(result: searchModel);
      } else {
        final searchModel = SearchModel(
          priceFromHighToLow: false,
          priceFromLowToHigh: true,
        );
        Get.back(result: searchModel);
      }

      // return;
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

  void selectListFacilities(String value) {
    if (!selectedFacilities.contains(value)) {
      selectedFacilities.add(value);
    } else {
      selectedFacilities.remove(value);
    }
  }

  void resetFilter() {
    minPrice.value = 0.0;
    maxPrice.value = 50000000.0;
    selectedStar.value = null;
    selectedSortPrice.call(null);
    selectedFacilities.clear();
  }

  void resetSortPrice() {
    selectedSortPrice.value = null;
  }
}
