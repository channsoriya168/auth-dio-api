import 'package:auth_dio_api/core/network/api_endpoint.dart';
import 'package:auth_dio_api/core/network/dio_client.dart';
import 'package:auth_dio_api/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final DioClient dioClient;
  AuthController({required this.dioClient});

  // login
Future login(String email, String password) async {
  try {
    final response = await dioClient.dio.post(
      ApiEndpoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );
    
    if (response.statusCode == 200) {
       final SharedPreferences prefs = await SharedPreferences.getInstance();
      // Save the token to the shared preferences
      await prefs.setString('token', response.data['token']);
      Get.snackbar('Success', 'Login Successful', snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed( AppRoutes.HOME_VIEW);
    } else {
      // Show error if the login fails
      Get.snackbar('Error', 'Login Failed: ${response.data['message']}');
    }
  } on DioException catch (e) {
    // Handle DioException
    if (e.response != null) {
      // Check the error response from the API
        Get.snackbar('Error', 'Login Failed: ${e.response?.data['message']}');
    } else {
      // Handle error without response (e.g., no connection)
      Get.snackbar('Error', 'Network Error');
    }
  }
}
// register
Future register(String name, String email, String password) async {
  try {
    final response = await dioClient.dio.post(
      ApiEndpoints.register,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );
    
    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Register Successful', snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed(AppRoutes.LOGIN_VIEW);
    } else {
      // Show error if the registration fails
      Get.snackbar('Error', 'Register Failed: ${response.data['message']}');
    }
  } on DioException catch (e) {
    // Handle DioException
    if (e.response != null) {
      // Check the error response from the API
      Get.snackbar('Error', 'Register Failed: ${e.response?.data['message']}');
    } else {
      // Handle error without response (e.g., no connection)
      Get.snackbar('Error', 'Network Error');
    }
  }
}
// Logout
Future logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  Get.offAllNamed(AppRoutes.LOGIN_VIEW);
}
}
  