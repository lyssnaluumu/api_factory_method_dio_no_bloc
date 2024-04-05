import 'package:api_papi/api/logic/api_exception.dart';
import 'package:api_papi/api/models/response_model.dart';
import 'package:dio/dio.dart';

final dio = Dio();

enum RequestType { auth, info, firebase }

abstract class ApiService {
  factory ApiService(RequestType type) {
    switch (type) {
      case RequestType.auth:
        return ApiAuth();

      case RequestType.info:
        return ApiInfo();

      case RequestType.firebase:
        return ApiFirebase();

      default:
        return ApiAuth();
    }
  }

  Future<dynamic> get(String path);
  Future<dynamic> post(String path, {Map<String, dynamic> data});
}

class ApiAuth implements ApiService {
  @override
  Future<dynamic> get(String path) async {
    final response = await dio.get(path);

    return ResponseModel.fromJson(response.data);
  }

  @override
  Future<dynamic> post(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.post(path, data: data);

      if (response.statusCode == 200 && !response.data['error']) {
        final ResponseModel decodedResponseModel =
            ResponseModel.fromJson(response.data);

        return decodedResponseModel;
      }
    } on DioException catch (_) {
      final ApiException exception = ApiException();

      return exception;
    }
  }
}

class ApiInfo implements ApiService {
  @override
  Future<dynamic> get(String path) async {
    final response = await dio.get(path);

    return ResponseModel.fromJson(response.data);
  }

  @override
  Future<dynamic> post(String path, {Map<String, dynamic>? data}) async {
    throw Exception();
  }
}

class ApiFirebase implements ApiService {
  @override
  Future<dynamic> get(String path) async {
    final response = await dio.get(path);

    return response.data;
  }

  @override
  Future<dynamic> post(String path, {Map<String, dynamic>? data}) async {
    final response = await dio.post(
      path,
      options: Options(contentType: 'application/json'),
      data: data,
    );
    
    return response.data;
  }
}

class ApiDefault implements ApiService {
  @override
  Future<dynamic> get(String path) async {
    final response = await dio.get(path);

    return ResponseModel.fromJson(response.data);
  }

  @override
  Future<dynamic> post(String path, {Map<String, dynamic>? data}) async {
    throw Exception();
  }
}
