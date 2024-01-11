import 'package:capstone_project_travel_ease/core/constraints/Constraints.dart';
import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class AppStartView extends StatefulWidget {
  const AppStartView({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  State<AppStartView> createState() => _AppStartViewState();
}

class _AppStartViewState extends State<AppStartView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final prefs = await SecureSharedPref.getInstance();
        bool isLogin = await prefs.getBool(Constant.isLogin) ?? false;
        if (isLogin) {
          print(isLogin);
          Get.offAllNamed(NavigatorMenuPage.routeName);
          return;
        }
        await Get.offAllNamed(NavigatorMenuPage.routeName);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.asset(
            fit: BoxFit.fill,
            Assets.images.startapp.path,
            width: 280,
            height: 280,
          ),
        ),
      ),
    );
  }
}
