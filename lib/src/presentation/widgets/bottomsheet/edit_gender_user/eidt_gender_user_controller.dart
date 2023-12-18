import 'package:get/get.dart';

class BottomSheetEditGenderUserController extends GetxController {
  BottomSheetEditGenderUserController({
    String? initialValue,
  }) {
    selectedGender.value = initialValue;
  }
  List<String> dsGender = ['Nam', "Nữ"];
  final Rxn<String> selectedGender = Rxn();
  final RxList<String> listGender = <String>[].obs;

  final RxBool isLoading = true.obs;
  @override
  void onInit() {
    loadDataGender();
    super.onInit();
  }

  Future<void> loadDataGender() async {
    listGender.call(dsGender);
  }

  void selectLocation(String? value) {
    if (selectedGender.value != value) {
      selectedGender.call(value);
      Get.back(result: selectedGender.value);
      return;
    }
    selectedGender.value = null;
  }
}
