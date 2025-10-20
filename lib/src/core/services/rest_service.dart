import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:roqu_copy_trader/src/core/models/app_responses.dart';
import 'package:roqu_copy_trader/src/core/services/log_service.dart';

class RestService {
  final _errorStream = StreamController<Response>.broadcast();
  Stream<Response> get errorStream => _errorStream.stream;

  late final Dio _client;
  RestService() {
    _client =
        Dio(
            BaseOptions(
              connectTimeout: const Duration(seconds: 25),
              sendTimeout: const Duration(seconds: 25),
              receiveTimeout: const Duration(seconds: 25),
            ),
          )
          ..options.headers.addAll({
            Headers.contentTypeHeader: Headers.jsonContentType,
            Headers.acceptHeader: Headers.textPlainContentType,
          })
          ..interceptors.addAll([
            InterceptorsWrapper(onRequest: _handleUserTokenOnRequest),
            // InterceptorsWrapper(onRequest: _encryptRequest),
          ])
          ..options.validateStatus = (_) => true;
  }

  void _handleUserTokenOnRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers['accept'] = 'application/json';
    return handler.next(options);
  }

  // void _encryptRequest(
  //   RequestOptions options,
  //   RequestInterceptorHandler handler,
  // ) {
  //   /// encryption happens here
  //   final encrypted = Encryption.encryptString(jsonEncode(options.data));
  //   options.data = encrypted.toMap();
  //   return handler.next(options);
  // }

  Future<ApiResponse> _handleResponse(
    Future<Response> Function() request,
  ) async {
    try {
      final response = await request();

      Map<String, dynamic> data;
      try {
        data = Map<String, dynamic>.from(response.data);
      } catch (e) {
        data = {};
      }

      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return ApiResponse(data: data, statusCode: response.statusCode!);
      }

      dLog('API error: - $response');

      _errorStream.add(response);

      if (response.statusCode == 401) return ApiError.unauthorized;

      // if (response.statusCode == 400) {
      return ApiError(
        message: data['message'] ?? data['error'] ?? ApiError.unknown.message,
        statusCode: response.statusCode ?? 500,
      );
      // }
    } on TimeoutException catch (_) {
      return ApiError.timeout;
    } on DioException catch (e) {
      if (e.response != null) {
        return ApiError(
          message:
              e.response!.data['message'] ??
              e.response!.data['error'] ??
              ApiError.unknown.message,
          statusCode: e.response!.statusCode ?? 500,
        );
      }
      if (e.error is SocketException) return ApiError.socket;
      if (e.type == DioExceptionType.connectionTimeout) return ApiError.timeout;
      if (e.type == DioExceptionType.receiveTimeout) return ApiError.timeout;
      if (e.type == DioExceptionType.sendTimeout) return ApiError.timeout;
      dLog('DioException: - $e');
      return ApiError(
        message: e.message ?? 'An error occured',
        statusCode: 500,
      );
    } catch (e, s) {
      dLog('API unknown Exception: - $e\n$s');
    }
    return ApiError.unknown;
  }

  Future<ApiResponse> get({
    required String path,
    Map<String, dynamic>? params,
  }) {
    return _handleResponse(() => _client.get(path, queryParameters: params));
  }

  Future<ApiResponse> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _handleResponse(
      () => _client.post(path, data: data, queryParameters: queryParameters),
    );
  }

  Future<ApiResponse> postFormData({required String path, FormData? data}) {
    return _handleResponse(() => _client.post(path, data: data));
  }

  Future<ApiResponse> patch({
    required String path,
    Map<String, dynamic>? data,
  }) {
    return _handleResponse(() => _client.patch(path, data: data));
  }

  Future<ApiResponse> put({required String path, Map<String, dynamic>? data}) {
    return _handleResponse(() => _client.put(path, data: data));
  }

  Future<ApiResponse> delete({
    required String path,
    Map<String, dynamic>? data,
  }) {
    return _handleResponse(() => _client.delete(path, data: data));
  }
}

extension ApiResponseExt on ApiResponse {
  bool get hasError => this is ApiError;
  ApiError get error => this as ApiError;
}
