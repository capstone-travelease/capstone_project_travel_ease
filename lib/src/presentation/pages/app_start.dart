import 'package:capstone_project_travel_ease/core/constrants/localvariable.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/login/login_page.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/navigator_menu/navigator_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        final prefs = await SharedPreferences.getInstance();
        bool isLogin = prefs.getBool(LocalVariable.isLogin) ?? false;
        if (isLogin) {
          print(isLogin);
          // Get.offAllNamed(NavigatorMenuPage.routeName);
          return;
        }
        Get.offAllNamed(NavigatorMenuPage.routeName);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: ElevatedButton(onPressed: () {}, child: Text('demo'))),
    );
  }
}
