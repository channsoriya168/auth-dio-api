import 'package:auth_dio_api/controllers/auth_controller.dart';
import 'package:auth_dio_api/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Home Screen',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                authController.logout();
              },
              child: const Text('Logout'),
            ),	
          ],
        ),
        
      ),  
    );
  }
}