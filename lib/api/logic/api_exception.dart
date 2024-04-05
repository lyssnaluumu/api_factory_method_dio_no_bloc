import 'package:dio/dio.dart';

class ApiException {
  List<String> getExceptionMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.badCertificate:
        return [
          'Status Code: ${exception.response?.statusCode}\nBad Certificate Exception'
        ];
      case DioExceptionType.badResponse:
        return [
          'Status Code: ${exception.response?.statusCode}\nBad Response Exception'
        ];
      case DioExceptionType.cancel:
        return [
          'Status Code: ${exception.response?.statusCode}\nCancel Exception'
        ];
      case DioExceptionType.connectionError:
        return [
          'Status Code: ${exception.response?.statusCode}\nConnection Error'
        ];
      case DioExceptionType.connectionTimeout:
        return [
          'Status Code: ${exception.response?.statusCode}\nConnection Timeout Exception'
        ];
      case DioExceptionType.receiveTimeout:
        return [
          'Status Code: ${exception.response?.statusCode}\nReceive Timeout Exception'
        ];
      case DioExceptionType.sendTimeout:
        return [
          'Status Code: ${exception.response?.statusCode}\nSend Timeout Exception'
        ];
      case DioExceptionType.unknown:
        return [
          'Status Code: ${exception.response?.statusCode}\nUnknown Exception'
        ];
    }
  }
}
