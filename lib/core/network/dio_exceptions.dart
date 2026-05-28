// Package imports:
import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "request Cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "connection timeout";
        break;
      case DioExceptionType.receiveTimeout:
        message = "receive_timeout";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "send_timeout";
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          message = 'no_internet';
          break;
        }
        message = "unexpected_error";
        break;
      default:
        message = "something_went_wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'bad_request';
      case 401:
        return 'unauthorized';
      case 403:
        return 'forbidden';
      case 404:
        return 'not_found';
      case 500:
        return 'internal_server_error';
      case 502:
        return 'bad_gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
