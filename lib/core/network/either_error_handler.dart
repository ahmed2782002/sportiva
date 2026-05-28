// Package imports:
import 'package:dio/dio.dart';

class EitherErrorHandler {
  static String handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';

      case DioExceptionType.badResponse:
        return _handleBadResponse(e);

      case DioExceptionType.cancel:
        return 'Request was cancelled.';

      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';

      case DioExceptionType.badCertificate:
        return 'Certificate error. Please try again.';

      case DioExceptionType.unknown:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  static String _handleBadResponse(DioException error) {
    final response = error.response;
    if (response != null) {
      final statusCode = response.statusCode;
      final data = response.data;

      // Handle specific error messages from API
      if (data is Map<String, dynamic>) {
        if (data.toString().contains('authenticat')) {
          // navigateFinish(LoginScreen());
          return data['message'].toString();
        }
        if (data.containsKey('message')) {
          return data['message'].toString();
        }
        if (data.containsKey('error')) {
          if (data['error'].toString().contains('authenticat')) {
            // navigateFinish(LoginScreen());
            return data['error'].toString();
          } else {
            return data['error'].toString();
          }
        }
        if (data.containsKey('errors')) {
          final errors = data['errors'];
          if (errors is Map<String, dynamic>) {
            // Get first error message
            final firstError = errors.values.first;
            if (firstError is List && firstError.isNotEmpty) {
              return firstError.first.toString();
            }
          }
        }
      }

      // Handle status codes
      switch (statusCode) {
        case 400:
          return 'Bad request. Please check your input.';
        case 401:
          return 'Invalid credentials. Please try again.';
        case 403:
          return 'Access denied.';
        case 404:
          return 'Resource not found.';
        case 422:
          return 'Validation error. Please check your input.';
        case 500:
          return 'Server error. Please try again later.';
        default:
          return 'An error occurred. Please try again.';
      }
    }

    return 'An error occurred. Please try again.';
  }
}
