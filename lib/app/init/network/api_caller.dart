import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pttem_flutter_template/app/init/network/interceptors/auth_interceptor.dart';
import 'api_exception.dart';

class ApiCaller {
  static ApiCaller? _instance;
  late final Dio _dio;

  static ApiCaller get instance {
    _instance ??= ApiCaller._init();
    return _instance!;
  }

  ApiCaller._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
    );

    _dio = Dio(baseOptions);

    final LogInterceptor logInterceptor = LogInterceptor(requestBody: true, error: true, responseBody: true);
    _dio.interceptors.add(logInterceptor);
    _dio.interceptors.add(AuthInterceptor());
  }

  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    dynamic responseJson;
    Response response;
    try {
      response = await _dio.get(path, queryParameters: queryParameters);

      responseJson = _handleResponse(response);
    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection\n$_');
    } on DioError catch (_) {
      if (_.error is SocketException) throw FetchDataException('No Internet connection\n${_.error}');
      _handleResponse(_.response);
    }

    return responseJson;
  }

  Future post(String url, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    dynamic responseJson;
    Response response;

    try {
      if (data == null) {
        response = await _dio.post(url, queryParameters: queryParameters);
      } else {
        response = await _dio.post(url, data: data, queryParameters: queryParameters);
      }

      responseJson = _handleResponse(response);
    } on SocketException catch (_) {
      throw FetchDataException('No Internet connection\n$_');
    } on DioError catch (_) {
      if (_.error is SocketException) throw FetchDataException('No Internet connection\n${_.error}');
      _handleResponse(_.response);
    }

    return responseJson;
  }

  dynamic _handleResponse(Response? response) {
    if (response == null) {
      throw FetchDataException('Unable to reach server. (response is null)');
    }

    final dynamic responseJson;

    responseJson = response.data;

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
      case HttpStatus.noContent:
        return responseJson;
      case HttpStatus.unauthorized:
        throw UnauthorizedException("unauthorized");
      case HttpStatus.forbidden:
      case HttpStatus.unprocessableEntity:
      case HttpStatus.badRequest:
        throw BadRequestException(responseJson['message'] ?? responseJson['detail']);
      case HttpStatus.internalServerError:
      default:
        throw FetchDataException(responseJson['message'] ?? 'Error occured with Server with StatusCode : ${response.statusCode}');
    }
  }
}
