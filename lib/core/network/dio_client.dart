// Dart imports:
import 'dart:developer';

// Package imports:

import 'package:dio/dio.dart';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'endpoints.dart';
import 'exceptions_interceptor.dart';
import 'reques_iInterceptor.dart';

class DioClient {
  final Dio _dio;
  final bool isSystem;

  DioClient(this._dio, {this.isSystem = false}) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.responseType = ResponseType.json
      ..options.connectTimeout = Duration(seconds: 7)
      ..options.receiveTimeout = Duration(seconds: 7)
      ..options.sendTimeout = Duration(seconds: 7)
      ..interceptors.add(ExceptionInterceptor())
      ..interceptors.add(RequestInterceptor())
      ..interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          logPrint: (o) => log(o.toString()),
        ),
      );
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (kDebugMode) {
      print('data send');
    }
    if (kDebugMode) {
      print(queryParameters);
    }
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      // final Response responseDone=Response(
      //   requestOptions: response.requestOptions,
      //   data: jsonDecode(response.data.toString()),
      //   extra:response.extra ,
      //   headers:response.headers ,
      //   isRedirect: response.isRedirect,
      //   redirects: response.redirects,
      //   statusCode:response.statusCode ,
      //   statusMessage: response.statusMessage,
      // );
      // return responseDone;
      return response;
    } catch (e) {
      log('Error in GET request: $e');
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    bool isJson = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (kDebugMode) {
      print('data send');
    }
    if (kDebugMode) {
      print(data);
    }
    try {
      final Response response = await _dio.post(
        uri,
        data: data != null
            ? isJson
                  ? data
                  : FormData.fromMap(data)
            : null,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      // final Response responseDone=Response(
      //     requestOptions: response.requestOptions,
      //     data: jsonDecode(response.data.toString()),
      //   extra:response.extra ,
      //   headers:response.headers ,
      //   isRedirect: response.isRedirect,
      //   redirects: response.redirects,
      //   statusCode:response.statusCode ,
      //   statusMessage: response.statusMessage,
      // );
      // return responseDone;
      return response;
    } catch (e) {
      log('Error in post request: $e');
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      log('Error in PUT request: $e');
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (kDebugMode) {
      print('delete request data');
    }
    if (kDebugMode) {
      print(data);
    }
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      log('Error in DELETE request: $e');
      rethrow;
    }
  }
}
