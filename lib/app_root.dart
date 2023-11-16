import 'package:capstone_project_travel_ease/core/initialize/global_binding.dart';
import 'package:capstone_project_travel_ease/core/initialize/styles/theme_material.dart';
import 'package:capstone_project_travel_ease/core/routers/router_configs.dart';
import 'package:capstone_project_travel_ease/src/presentation/pages/app_start.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});
  static const String routeName = '/';

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TravelEase',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      getPages: RouterConfigs.routes,
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: CoreTheme.theme,
      initialRoute: AppStartView.routeName,
    );
  }
}
