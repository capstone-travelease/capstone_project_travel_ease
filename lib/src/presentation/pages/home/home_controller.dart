import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/src/domain/models/hotel_model.dart';
import 'package:capstone_project_travel_ease/src/domain/services/booking_service.dart';
import 'package:capstone_project_travel_ease/src/presentation/controller/checklogin_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/notification/notification_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/login/login_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/dia_log/dialog_notification.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxBool isLoading = false.obs;
  int userId = 0;
  final CheckLoginController checkLoginController = Get.find();
  final RxList<HotelModel> proposeHotel = <HotelModel>[].obs;
  final BookingService _bookingService =
      Get.find(tag: Constant.bookingServiceTAG);
  @override
  void onInit() {
    fetchProposeHotel();
    super.onInit();
  }

  Future<void> fetchProposeHotel() async {
    try {
      final res = await _bookingService.proposeHotel();
      proposeHotel.call(res);
    } catch (error) {
      Get.log(
        error.toString(),
      );
    }
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
