// Flutter imports:
// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// Project imports:
import 'dio_exceptions.dart';

class ExceptionInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final DioExceptions exceptions = DioExceptions.fromDioError(err);
    debugPrint(exceptions.message);
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    super.onError(err, handler);
  }
}
