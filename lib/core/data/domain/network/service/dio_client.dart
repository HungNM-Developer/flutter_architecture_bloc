import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_architecture_bloc/config/config.dart';
import '../../local/secure_storage.dart';
import '../simple_reponse/simple_reponse.dart';
import 'app_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio;
  final SecureStorage _storage;

  DioClient(this._dio, this._storage) {
    _dio
      ..options.baseUrl = Config.baseUrl
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

  Future<SingleResponse> get(
    String uri, {
    dynamic object,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response = await _dio.get(
      uri,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return _handleResponse(response, object);
  }

  Future<SingleResponse> post<T>(
    String uri, {
    dynamic object,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response = await _dio.post(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return _handleResponse(response, object);
  }

  Future<SingleResponse> put<T>(
    String uri, {
    dynamic object,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response response = await _dio.put(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return _handleResponse(response, object);
  }

  Future<SingleResponse> delete<T>(
    String uri, {
    dynamic object,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    required T? Function(dynamic) mapper,
  }) async {
    Response response = await _dio.put(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return _handleResponse(response, object);
  }

  Future<SingleResponse> _handleResponse(
      final Response response, dynamic object) async {
    try {
      dynamic parsed;
      if (response.statusCode == 200) {
        parsed = {
          'status': 'ok',
          'msg': 'successfully',
          'code': 200,
          'data': response.data,
        };
        print(
          response.data,
        );
        SingleResponse data = SingleResponse.fromJson(
          parsed,
          object,
        );
        return data;
      } else {
        return SingleResponse();
      }
    } catch (e) {
      if (e is DioError) {
        return SingleResponse(msg: e.message);
      }
      return SingleResponse(msg: e.toString());
    }
  }
}
