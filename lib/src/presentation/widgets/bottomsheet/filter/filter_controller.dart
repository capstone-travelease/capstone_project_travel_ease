import 'package:get/get.dart';

class FilterController extends GetxController {
  final RxDouble minPrice = 0.0.obs;
  final RxDouble maxPrice = 50000000.0.obs;

// Function to update the price range
  void updatePriceRange(double min, double max) {
    minPrice.value = min;
    maxPrice.value = max;
  }
}
