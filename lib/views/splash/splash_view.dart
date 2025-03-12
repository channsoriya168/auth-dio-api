import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auth_dio_api/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Adjust your import

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Start navigation after 2 seconds
    Future.delayed(const Duration(seconds: 2), () async {
      // Use Get.offNamed with correct transition and duration
        final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null && token.isNotEmpty) {
        Get.offNamed(AppRoutes.HOME_VIEW);
      } else {
        Get.offNamed(AppRoutes.LOGIN_VIEW);
      }
    });

    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
