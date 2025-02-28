import 'package:dio/dio.dart';

import '../helpers/logger.dart';

class Connection {
  static final Connection _instance = Connection._internal();
  static Dio? _dio;

  factory Connection() {
    return _instance;
  }

  Connection._internal();

  Future<Response> get(String url, {Map<String, dynamic>? params, Options? options}) async {
    if (_dio != null) {
      return await _dio!.get(url, queryParameters: params, options: options).then(
        (response) {
          if (response.statusCode.toString().startsWith('2')) {
            logI('GET $url performed successfully :: data: ${response.data}');
            return response;
          }
          logW('GET $url failed with status code ${response.statusCode}');
          return response;
        },
      );
    }
    throw Exception('Dio is not initialized');
  }

  Future<Response> post(String url, {dynamic data, Map<String, dynamic>? params, Options? options}) async {
    if (_dio != null) {
      return await _dio!.post(url, data: data, queryParameters: params, options: options).then(
        (response) {
          if (response.statusCode.toString().startsWith('2')) {
            logI('GET $url performed successfully :: data: ${response.data}');
            return response;
          }
          logW('GET $url failed with status code ${response.statusCode}');
          return response;
        },
      );
    }
    throw Exception('Dio is not initialized');
  }

  Future<Response> put(String url, {dynamic data, Map<String, dynamic>? params, Options? options}) async {
    if (_dio != null) {
      return await _dio!.put(url, data: data, queryParameters: params, options: options).then(
        (response) {
          if (response.statusCode.toString().startsWith('2')) {
            logI('GET $url performed successfully :: data: ${response.data}');
            return response;
          }
          logW('GET $url failed with status code ${response.statusCode}');
          return response;
        },
      );
    }
    throw Exception('Dio is not initialized');
  }

  Future<Response> delete(String url, {dynamic data, Map<String, dynamic>? params, Options? options}) async {
    if (_dio != null) {
      return await _dio!.delete(url, data: data, queryParameters: params, options: options).then(
        (response) {
          if (response.statusCode.toString().startsWith('2')) {
            logI('GET $url performed successfully :: data: ${response.data}');
            return response;
          }
          logW('GET $url failed with status code ${response.statusCode}');
          return response;
        },
      );
    }
    throw Exception('Dio is not initialized');
  }

  Future<void> init(String baseUrl) async {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<void> close() async {
    _dio?.close();
  }
}
