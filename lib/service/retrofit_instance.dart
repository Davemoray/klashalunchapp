import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'data_service.dart';

String _baseUrl = "https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev";
class RetrofitClientInstance {
  static RetrofitClientInstance _instance = RetrofitClientInstance._internal();
  late Dio _dio;
  GetDataService? _client;

  RetrofitClientInstance._internal([String? authToken = '']) {
    _dio = Dio();
    _dio.options.responseType = ResponseType.json;
    _dio.options.headers["accept"] = "application/json";
    _dio.options.connectTimeout = Duration(seconds: 30);
    if (!kReleaseMode) {
      _dio.interceptors
          .add(LogInterceptor(responseBody: true, requestBody: true));
    }

    _client = GetDataService(_dio, baseUrl: _baseUrl);
  }

  static RetrofitClientInstance getInstance() {
    return _instance;
  }

  GetDataService? getDataService() {
    return _client;
  }

}