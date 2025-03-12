import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:82/laravel-api/public/api/v1", // Change API URL here
           connectTimeout: const Duration(seconds: 30),
           receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  Dio get dio => _dio;
}