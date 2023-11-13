import 'package:capstone_project_travel_ease/core/constrants/localvariable.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxString fullName = ''.obs;
  RxString avatar = ''.obs;
  // late final String userName;
  RxBool isLogin = false.obs;
  final RxList<String> listImage = <String>[].obs;

  List<String> dsImage = [
    'https://www.hotelgrandsaigon.com/wp-content/uploads/sites/227/2017/12/GRAND_SEDK_01.jpg',
    'https://images.squarespace-cdn.com/content/v1/5aadf482aa49a1d810879b88/1626698419120-J7CH9BPMB2YI728SLFPN/1.jpg',
    'https://asiky.com/files/images/Article/tin-tuc/chup-anh-khach-san.jpg',
    'https://cf.bstatic.com/xdata/images/hotel/max1024x768/382586584.jpg?k=c615c33d39628661129df3581cdf4eacc434cccdd69ed4fc62be839d28f526af&o=&hp=1'
  ];

  @override
  void onInit() {
    loadData();
    addUser();
    super.onInit();
  }

  Future<void> loadData() async {
    listImage.call(dsImage);
  }

  Future<void> addUser() async {
    final prefs = await SharedPreferences.getInstance();

    isLogin.value = prefs.getBool(LocalVariable.isLogin) ?? false;

    /// set userName trên drawer
    fullName.value = prefs.getString(LocalVariable.fullName) ?? '';
    avatar.value = prefs.getString(LocalVariable.avatar) ?? '';
  }
}
