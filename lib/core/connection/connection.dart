import 'dart:io';

import 'package:dio/dio.dart';

import '../helpers/logger.dart';

class Connection {
  static final Connection _instance = Connection._internal();
  static Dio? _dio;
  final String _baseUrl = Platform.isAndroid ? 'http://10.0.2.2:8081' : 'http://localhost:8081';
  String token = '';

  String getBaseUrl() => _baseUrl;

  factory Connection() {
    _dio ??= Dio(BaseOptions(baseUrl: _instance._baseUrl));
    return _instance;
  }

  Connection._internal();

  Future<Response> get(String url, {Map<String, dynamic>? params, Options? options}) async {
    logI('GET $url with params: $params');
    if (_dio != null) {
      return await _dio!
          .get(
        url,
        queryParameters: params,
        options: options?.copyWith(
            headers: options.headers
              ?..addAll(
                {'Authorization': 'Bearer $token'},
              )),
      )
          .then(
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
    logI('POST $url with data: $data and params: $params');
    if (_dio != null) {
      return await _dio!
          .post(
        url,
        data: data,
        queryParameters: params,
        options: options?.copyWith(
            headers: options.headers
              ?..addAll(
                {'Authorization': 'Bearer $token'},
              )),
      )
          .then(
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
    logI('PUT $url with data: $data and params: $params');
    if (_dio != null) {
      return await _dio!
          .put(
        url,
        data: data,
        queryParameters: params,
        options: options?.copyWith(
            headers: options.headers
              ?..addAll(
                {'Authorization': 'Bearer $token'},
              )),
      )
          .then(
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
    logI('DELETE $url with data: $data and params: $params');
    if (_dio != null) {
      return await _dio!
          .delete(
        url,
        data: data,
        queryParameters: params,
        options: options?.copyWith(
            headers: options.headers
              ?..addAll(
                {'Authorization': 'Bearer $token'},
              )),
      )
          .then(
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
