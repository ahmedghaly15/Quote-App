import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:quotes_app/locator.dart';
import 'package:quotes_app/src/core/api/api_consumer.dart';
import 'package:quotes_app/src/core/api/app_interceptors.dart';
import 'package:quotes_app/src/core/api/end_points.dart';
import 'package:quotes_app/src/core/api/status_code.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };

    client.interceptors.add(serviceLocator.get<AppInterceptors>());

    if (kDebugMode) {
      client.interceptors.add(serviceLocator.get<LogInterceptor>());
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await client.get(path, queryParameters: queryParameters);
    return _handleResponse(response);
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final response = await client.post(
      path,
      queryParameters: queryParameters,
      data: body,
    );

    return _handleResponse(response);
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final response = await client.put(
      path,
      queryParameters: queryParameters,
      data: body,
    );

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
}
