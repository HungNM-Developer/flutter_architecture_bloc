// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:dio/dio.dart';

import '../../local/secure_storage.dart';
import '../../local/secure_storage_keys.dart';

class AppInterceptor extends Interceptor {
  final Dio _dio;
  final SecureStorage _storage;

  AppInterceptor(this._dio, this._storage);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storage.getValue(SecureStorageKeys.accessToken) ?? '';
    options.headers = {
      'accessToken': token,
    };
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final refreshToken =
          await _storage.getValue(SecureStorageKeys.refreshToken) ?? '';
      if (refreshToken.isEmpty) return handler.next(err);
      _dio.interceptors.requestLock.lock();
      _dio.interceptors.responseLock.lock();

      final options = err.requestOptions;

      _dio.interceptors.requestLock.unlock();
      _dio.interceptors.responseLock.unlock();
      final response = await _dio.request(
        options.path,
        data: options.data,
        queryParameters: options.queryParameters,
        options: Options(
          method: options.method,
          headers: options.headers,
          contentType: options.contentType,
          responseType: options.responseType,
          receiveTimeout: options.receiveTimeout,
          sendTimeout: options.sendTimeout,
        ),
      );
      return handler.resolve(response);
    }
    super.onError(err, handler);
  }
}
