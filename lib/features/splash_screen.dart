import 'package:ecommerce_app/config/routes/routes.dart';
import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, Routes.login);
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Image.asset(AppImages.splashScreen),
    );
  }
}
