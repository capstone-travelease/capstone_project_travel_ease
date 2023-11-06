import 'package:capstone_project_travel_ease/src/presentation/pages/app_start.dart';
import 'package:get/get.dart';
import 'package:package_login/core/routers/router_configs.dart';

class RouterConfigs {
  static final List<GetPage<void>> routes = [
    GetPage(
      name: AppStartView.routeName,
      page: () => const AppStartView(),
    ),
    ...RouterUserConfigs.routes
  ];
}
