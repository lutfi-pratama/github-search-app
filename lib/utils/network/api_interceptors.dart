import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:github_search_app/utils/cast_value.dart';
import '../../resources/resources.dart';

class ApiInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var requestBody = '';
    try {
      requestBody = const JsonEncoder.withIndent('  ').convert(options.data);
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {}

    final queryParameters =
        const JsonEncoder.withIndent('  ').convert(options.queryParameters);

    log(
      'Request URL : ${options.uri}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Request Body: $requestBody\n'
      'Request Query Parameters: $queryParameters\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Method: ${options.method}\n',
    );

    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final responseData = response.data as Map<String, dynamic>;

    final responseString =
        const JsonEncoder.withIndent('  ').convert(response.data);
    log(
      'Status Code: ${response.statusCode}\n'
      '——————————————————————————————————————————————————————————————————————\n'
      'Response : $responseString\n',
    );

    final baseResponse = BaseResponseMdl<dynamic>(
      totalCount: CastValue.toInteger(responseData['total_count']),
      incompleteResults:
          CastValue.toBoolean(responseData['incomplete_results']),
      items: responseData['items'],
    );

    return handler.next(
      Response<BaseResponseMdl<dynamic>>(
        data: baseResponse,
        headers: response.headers,
        requestOptions: response.requestOptions,
        isRedirect: response.isRedirect,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        extra: response.extra,
      ),
    );
  }
}
