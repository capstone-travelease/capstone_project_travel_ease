import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/notification/notification_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/login/login_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_notification.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<String> listImage = <String>[].obs;
  // String? fullname;
  final CheckLoginController checkLoginController = Get.find();
  List<String> dsImage = [
    'https://www.hotelgrandsaigon.com/wp-content/uploads/sites/227/2017/12/GRAND_SEDK_01.jpg',
    'https://images.squarespace-cdn.com/content/v1/5aadf482aa49a1d810879b88/1626698419120-J7CH9BPMB2YI728SLFPN/1.jpg',
    'https://asiky.com/files/images/Article/tin-tuc/chup-anh-khach-san.jpg',
    'https://cf.bstatic.com/xdata/images/hotel/max1024x768/382586584.jpg?k=c615c33d39628661129df3581cdf4eacc434cccdd69ed4fc62be839d28f526af&o=&hp=1'
  ];

  @override
  void onInit() {
    loadData();
    // checkLoginController.checkLogin();
    // fullname == checkLoginController.fullName.value;
    super.onInit();
  }

  Future<void> loadData() async {
    listImage.call(dsImage);
  }

  Future<void> pushLogin() async {
    await Get.toNamed(LoginView.routeName);
    await checkLoginController.checkLogin();
  }

  Future<void> geToNotification() async {
    if (checkLoginController.isLogin.value == false) {
      Get.dialog(
        DiaLogNotification(
          onTap: () async {
            await Get.toNamed(LoginView.routeName);
            await checkLoginController.checkLogin();
            Get.back();
          },
          title: 'Thông Báo',
          content: 'Đăng nhập để sử dụng chức năng !',
          okText: 'Đăng Nhập',
        ),
      );
    } else {
      Get.toNamed(NotificationPage.routeName);
    }
  }
}
