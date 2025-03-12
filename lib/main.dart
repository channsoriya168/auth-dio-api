import 'package:auth_dio_api/routes/app_pages.dart';
import 'package:auth_dio_api/routes/app_routes.dart';
import 'package:auth_dio_api/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.SPLASH_VIEW,
       getPages: AppPages.routes,
       debugShowCheckedModeBanner: false,
    );
  }
}
