import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_login/package_login.dart';

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
        // final prefs = await SharedPreferences.getInstance();
        // bool isLogin = prefs.getBool(LocalVariable.isLogin) ?? false;
        // if (isLogin) {
        //   print(isLogin);
        //   Get.offAllNamed(RootApp.routerName);
        //   return;
        // }
        // Get.offAllNamed(CoreUserPackage.goLogin as String);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () => CoreUserPackage.goLogin(), child: Text('demo'))),
    );
  }
}
