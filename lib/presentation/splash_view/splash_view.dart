import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Lottie.asset(LottieImages.splashLottie, onLoaded: (compo) {
          Future.delayed(const Duration(seconds: 5), () {
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
          });
        }, frameRate: FrameRate.max, repeat: false, fit: BoxFit.contain),
      ),
    );
  }
}
