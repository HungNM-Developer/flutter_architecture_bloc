import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_architecture_bloc/config/config.dart';
import 'package:flutter_architecture_bloc/core/domain/local/secure_storage.dart';
import '../response/api_response.dart';
import 'app_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio;
  final SecureStorage _storage;

  DioClient(this._dio, this._storage) {
    _dio
      ..options.baseUrl = Config.host
      ..options.connectTimeout = Config.connectionTimeout
      ..options.receiveTimeout = Config.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.addAll(<Interceptor>[
        AppInterceptor(_dio, _storage),
        if (kDebugMode)
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
          ),
      ]);
  }

  Future<ApiResponse<T?>> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    required T? Function(dynamic) mapper,
  }) {
    return _handleResponse(
      () {
        return _dio.get(
          uri,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
      },
      mapper,
    );
  }

  Future<ApiResponse<T?>> post<T>(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T? Function(dynamic) mapper,
  }) {
    return _handleResponse(
      () {
        return _dio.post(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
      },
      mapper,
    );
  }

  Future<ApiResponse<T?>> put<T>(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T? Function(dynamic) mapper,
  }) {
    return _handleResponse(() {
      return _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    }, mapper);
  }

  Future<ApiResponse<T?>> delete<T>(
    String uri, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T? Function(dynamic) mapper,
  }) {
    return _handleResponse(
      () {
        return _dio.delete(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      },
      mapper,
    );
  }

  Future<ApiResponse<T?>> _handleResponse<T>(
    Future<Response<Map<String, dynamic>>> Function() func,
    T? Function(dynamic)? mapper,
  ) async {
    try {
      final Response<Map<String, dynamic>> result = await func();
      final Map<String, dynamic> data = result.data ?? {};
      final apiResponse =
          ApiResponse<T?>.fromJson(data, (p0) => mapper?.call(data['data']));
      return apiResponse;
    } catch (e) {
      if (e is DioError) {
        return ApiResponse<T?>(message: e.message);
      }
      return ApiResponse<T?>(message: e.toString());
    }
  }
}
