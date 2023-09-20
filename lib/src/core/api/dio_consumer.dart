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

import '../errors/exception.dart';

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
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return _handleResponse(response);
    } on DioException catch (exception) {
      _handleDioError(exception);
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );

      return _handleResponse(response);
    } on DioException catch (exception) {
      _handleDioError(exception);
    }
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: body,
      );

      return _handleResponse(response);
    } on DioException catch (exception) {
      _handleDioError(exception);
    }
  }

  dynamic _handleResponse(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }

  dynamic _handleDioError(DioException exception) {
    switch (exception.type) {
      case DioException.connectionTimeout:
      case DioException.sendTimeout:
      case DioException.receiveTimeout:
        throw const FetchDataException();
      case DioException.badResponse:
        switch (exception.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unAuthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioException.requestCancelled:
        break;
      case DioException.connectionError:
        throw const NoInternetConnectionException();

      default:
        throw const NoInternetConnectionException();
    }
  }
}
