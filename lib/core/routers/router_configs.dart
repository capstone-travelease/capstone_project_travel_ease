import 'package:capstone_project_travel_ease/src/presentation/pages/app_start.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/booking/booking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/booking/booking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/home/home_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/home/home_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/hotel_detal/hotel_detail_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/hotel_detal/hotel_detail_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/list_room/list_room_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/list_room/list_room_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/login/login_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/login/login_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/mybooking/mybooking_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/mybooking/mybooking_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/profile/profile_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/profile/profile_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/room_detail/room_detail_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/room_detail/room_detail_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/search_hotel/search_hotel_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/search_hotel/search_hotel_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/sign/sign_controller.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/sign/sign_page.dart';
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
  ];
}
