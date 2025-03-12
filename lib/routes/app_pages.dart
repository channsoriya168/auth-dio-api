import 'package:auth_dio_api/binding/auth_binding.dart';
import 'package:auth_dio_api/routes/app_routes.dart';
import 'package:auth_dio_api/views/auth/login_view.dart';
import 'package:auth_dio_api/views/auth/register_view.dart';
import 'package:auth_dio_api/views/home/home_view.dart';
import 'package:auth_dio_api/views/splash/splash_view.dart';
import 'package:get/get.dart';

class AppPages {
   static final routes=[
     GetPage(
      name: AppRoutes.SPLASH_VIEW,
      page: () =>const SplashView(),
     ),
     GetPage(
      name: AppRoutes.LOGIN_VIEW,
      page: () =>const LoginView(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: AuthBinding()
     ),
    GetPage(
      name: AppRoutes.REGISTER_VIEW,
      page: () =>const RegisterView(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: AuthBinding()
     ),
    GetPage(
      name: AppRoutes.HOME_VIEW,
      page: () =>const HomeView(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
       binding: AuthBinding()
     ),
   ];
}