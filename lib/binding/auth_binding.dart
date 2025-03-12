import 'package:auth_dio_api/controllers/auth_controller.dart';
import 'package:auth_dio_api/core/network/dio_client.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioClient(),);
    Get.lazyPut(() => AuthController(dioClient: Get.find()),);
  }
  
}