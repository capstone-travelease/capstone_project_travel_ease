import 'package:get/get.dart';

class BottomSheetLocationController extends GetxController {
  List<String> dsTp = ['Hồ Chi Minh', 'Đà Lạt', 'Đà Nẵng', 'Hà Nội'];
  final RxList<String> listItem = <String>[].obs;
  final Rxn<String> selectedLocation = Rxn();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    listItem.call(dsTp);
  }

  void selectLocation(String? value) {
    if (selectedLocation.value != value) {
      selectedLocation.call(value);
      // location = value;
      Get.back(result: selectedLocation.value);
      return;
    }
  }
}
