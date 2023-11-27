import 'package:capstone_project_travel_ease/src/presentation/pages/app_start.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/home/home_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/home/home_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/booking/booking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/mybooking/mybooking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/ticket/ticket_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_booking/ticket/ticket_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/change_password/change_password_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/change_password/change_password_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/edit_profile/edit_profile_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/edit_profile/edit_profile_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/my_bookmark/my_bookmark_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/my_bookmark/my_bookmark_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/profile/profile_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_profile/profile/profile_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/hotel_detal/hotel_detail_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/hotel_detal/hotel_detail_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/list_room/list_room_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/list_room/list_room_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/room_detail/room_detail_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/room_detail/room_detail_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/search_hotel/search_hotel_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_hotel/search_hotel/search_hotel_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/login/login_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/login/login_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/sign/sign_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/pages_user/sign/sign_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/widgets/loading.dart';
import 'package:get/get.dart';

class RouterConfigs {
  static final List<GetPage<void>> routes = [
    GetPage(
      name: AppStartView.routeName,
      page: () => const AppStartView(),
    ),
    GetPage(
      name: LoginView.routeName,
      page: () => const LoginView(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(LoginController.new),
      ),
    ),
    GetPage(
      name: SignPage.routeName,
      page: () => const SignPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(SignController.new),
      ),
    ),
    GetPage(
      name: LoadingPage.routeName,
      page: () => const LoadingPage(),
    ),
    GetPage(
      name: NavigatorMenuPage.routeName,
      page: () => const NavigatorMenuPage(),
      binding: BindingsBuilder<void>(() {
        Get.lazyPut(NavigatorMenuController.new);
        Get.lazyPut(HomeController.new);
        Get.lazyPut(MyBookingController.new);
        Get.lazyPut(ProfileController.new);
      }),
    ),
    GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: BindingsBuilder<void>(
        () {
          Get.lazyPut(HomeController.new);
        },
      ),
    ),
    GetPage(
      name: MyBookingPage.routeName,
      page: () => const MyBookingPage(),
      binding: BindingsBuilder<void>(
        () {
          Get.lazyPut(MyBookingController.new);
        },
      ),
    ),
    GetPage(
      name: ProfilePage.routeName,
      page: () => const ProfilePage(),
      binding: BindingsBuilder<void>(
        () {
          Get.lazyPut(ProfileController.new);
        },
      ),
    ),
    GetPage(
      name: SearchHotelPage.routeName,
      page: () => const SearchHotelPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(SearchHotelController.new),
      ),
    ),
    GetPage(
      name: HotelDetailPage.routeName,
      page: () => const HotelDetailPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(HotelDetailController.new),
      ),
    ),
    GetPage(
      name: ListRoomPage.routeName,
      page: () => const ListRoomPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(ListRoomController.new),
      ),
    ),
    GetPage(
      name: RoomDetailPage.routeName,
      page: () => const RoomDetailPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(RoomDetailController.new),
      ),
    ),
    GetPage(
      name: BookingPage.routeName,
      page: () => const BookingPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(BookingController.new),
      ),
    ),
    GetPage(
      name: ChangePassWordPage.routeName,
      page: () => const ChangePassWordPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(ChangePassWordController.new),
      ),
    ),
    GetPage(
      name: EditProfilePage.routeName,
      page: () => const EditProfilePage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(EditProfileController.new),
      ),
    ),
    GetPage(
      name: MyBookMarkPage.routeName,
      page: () => const MyBookMarkPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(MyBookMarkController.new),
      ),
    ),
    GetPage(
      name: TicketPage.routeName,
      page: () => const TicketPage(),
      binding: BindingsBuilder<void>(
        () => Get.lazyPut(TicketController.new),
      ),
    ),
  ];
}
