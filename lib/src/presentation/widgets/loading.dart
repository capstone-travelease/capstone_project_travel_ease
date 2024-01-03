import 'package:capstone_project_travel_ease/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  static const String routeName = '/LoadingPage';

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.5),
      child: Center(
        child: Lottie.asset(
          Assets.animations.loading1, // Replace with your animation file
          width: 180,
          height: 180,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
