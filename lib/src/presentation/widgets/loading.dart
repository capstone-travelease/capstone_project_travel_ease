import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  static const String routeName = '/LoadingPage';

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          Assets.animations.loading,
          width: 150,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
