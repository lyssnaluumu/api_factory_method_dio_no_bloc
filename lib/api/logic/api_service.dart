import 'package:api_papi/api/logic/api_exception.dart';
import 'package:api_papi/api/models/response_model.dart';
import 'package:dio/dio.dart';

final dio = Dio();

enum RequestType { auth, info, firebase }

enum OptionType {
  path,
  data,
  queryParameters,
  options,
  cancelToken,
  onSendProgress,
  onReceiveProgress,
}

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

  Future<dynamic> get(Map<OptionType, dynamic> params);
  Future<dynamic> post(Map<OptionType, dynamic> params);
}

class ApiAuth implements ApiService {
  @override
  Future<dynamic> get(Map<OptionType, dynamic> params) async {
    final response = await dio.get(params[OptionType.path]);

    return ResponseModel.fromJson(response.data);
  }

  @override
  Future<dynamic> post(Map<OptionType, dynamic> params) async {
    try {
      final response = await dio.post(params[OptionType.path], data: params[OptionType.data]);

      if (response.statusCode == 200 && !response.data['error']) {
        final ResponseModel decodedResponseModel =
            ResponseModel.fromJson(response.data);

        return decodedResponseModel;
      }
    } on DioException catch (e) {
      final List<String> exception = ApiException.getExceptionMessage(e);

      return exception[0];
    }
  }
}

class ApiInfo implements ApiService {
  @override
  Future<dynamic> get(Map<OptionType, dynamic> params) async {
    final response = await dio.get(params[OptionType.path]);

    return ResponseModel.fromJson(response.data);
  }

  @override
  Future<dynamic> post(Map<OptionType, dynamic> params) async {
    throw Exception();
  }
}

class ApiFirebase implements ApiService {
  @override
  Future<dynamic> get(Map<OptionType, dynamic> params) async {
    final response = await dio.get(params[OptionType.path]);

    return response.data;
  }

  @override
  Future<dynamic> post(Map<OptionType, dynamic> params) async {
    final response = await dio.post(
      params[OptionType.path],
      options: Options(contentType: 'application/json'),
      data: params[OptionType.data],
    );

    return response.data;
  }
}

class ApiDefault implements ApiService {
  @override
  Future<dynamic> get(Map<OptionType, dynamic> params) async {
    final response = await dio.get(params[OptionType.path]);

    return ResponseModel.fromJson(response.data);
  }

  @override
  Future<dynamic> post(Map<OptionType, dynamic> params) async {
    throw Exception();
  }
}
