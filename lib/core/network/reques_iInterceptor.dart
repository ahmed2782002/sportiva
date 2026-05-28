// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:dio/dio.dart';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../cache/shared_preferences_manager.dart';

class RequestInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    final accessToken = SharedPref.getString('token') ?? '';
    final lang = SharedPref.getString('locale') ?? 'en';
    options.headers['Accept-Language'] = lang;
    options.headers['Content-Type'] = 'application/json';
    options.headers['accept'] = 'application/json';
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    log('accessToken: => $accessToken');
    super.onRequest(options, handler);
  }
}
