import 'package:dio/dio.dart';

import '../../../utils/utils.dart';
import '../../../di/index.dart';
import '../../../resources/resources.dart';

class ApiServices {
  static final DioHandler dioHandler = gt.get();

  static Future<Response<BaseResponseMdl<dynamic>>> request({
    required String path,
    required HttpMethod method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) {
    String? httpMethodStr;

    switch (method) {
      case HttpMethod.get:
        httpMethodStr = 'GET';
        break;
      case HttpMethod.post:
        httpMethodStr = 'POST';
        break;
      case HttpMethod.put:
        httpMethodStr = 'PUT';
        break;
      case HttpMethod.delete:
        httpMethodStr = 'DELETE';
        break;
    }

    return dioHandler.getDio().request(
          path,
          queryParameters: queryParameters,
          data: data,
          options: Options(method: httpMethodStr),
        );
  }
}
