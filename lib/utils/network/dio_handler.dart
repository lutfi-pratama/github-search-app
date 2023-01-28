import 'package:dio/dio.dart';
import 'api_interceptors.dart';

class DioHandler {
  DioHandler({required this.apiBaseUrl});

  final String apiBaseUrl;

  Dio getDio() {
    final options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );

    final dio = Dio(options);
    dio.interceptors.add(ApiInterceptors());

    return dio;
  }
}
