import 'package:get/get.dart';

class FilterController extends GetxController {
  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 50000000.0.obs;
  List<int> dsStar = [5, 4, 3, 2, 1];
  final Rxn<int> selectedStar = Rxn();
  @override
  void onInit() {
    selectStar(dsStar.first);
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
}
