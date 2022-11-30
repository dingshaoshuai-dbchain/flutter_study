import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dss_base_flutter/model/function_ext.dart';
import 'package:dss_base_flutter/widgets/base/base_view_model.dart';

import 'base_entity.dart';

typedef NetSuccessCallback = Function(dynamic data);
typedef NetSuccessCallbackT<T> = Function(T data);
typedef NetFailureCallback = Function(int code, String msg);

class HttpUtil {
  HttpUtil._();

  static final HttpUtil _singleton = HttpUtil._();

  factory HttpUtil() => _singleton;

  static HttpUtil get instance => _singleton;

  late final Dio _dio;

  static const String methodGet = 'GET';
  static const String methodPost = 'POST';
  static const String methodPut = 'PUT';
  static const String methodDelete = 'DELETE';

  /// 初始化Dio配置
  void init({
    required String baseUrl,
    int connectTimeout = 15000,
    int receiveTimeout = 15000,
    int sendTimeout = 15000,
    List<Interceptor>? interceptors,
  }) {
    final BaseOptions options = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,

      /// dio默认json解析，这里指定返回UTF8字符串，自己处理解析。（可也以自定义Transformer实现）
      responseType: ResponseType.plain,
      validateStatus: (_) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
      baseUrl: baseUrl,
      // contentType: Headers.formUrlEncodedContentType, // 适用于post form表单提交
    );
    _dio = Dio(options);
    interceptors?.forEach((element) {
      _dio.interceptors.add(element);
    });
  }

  /// 请求 - GET - st ==========================================================
  Future<BaseEntity> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) {
    return _request(
      url: url,
      method: methodGet,
      queryParameters: queryParameters,
    ).onError((error, stackTrace) => _defaultErrorEntity);
  }

  void getCallback<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    InputDynamicReturnValueFunction<T>? convert,
    required NetSuccessCallbackT<T> onSuccess,
    required NetFailureCallback onFailure,
  }) {
    var future = get(
      url: url,
      queryParameters: queryParameters,
    );
    simpleCallback(
      future: future,
      convert: convert,
      onSuccess: onSuccess,
      onFailure: onFailure,
    );
  }

  /// 简单搞一个
  Future simpleCallback<T>({
    required Future<BaseEntity> future,
    InputDynamicReturnValueFunction<T>? convert,
    required NetSuccessCallbackT<T> onSuccess,
    required NetFailureCallback onFailure,
  }) {
    return future.then((value) {
      if (value.code == Code.success.code) {
        if (convert == null) {
          onSuccess(value.data);
        } else {
          T data = convert(value.data);
          onSuccess(data);
        }
      } else {
        onFailure(value.code, value.msg ?? Code.failure.msg);
      }
    });
  }

  /// 请求 - GET - ed ==========================================================

  Future<BaseEntity> _request({
    required String method,
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response =
          await _dio.request(url, queryParameters: queryParameters);
      final String data = response.data.toString();
      Map<String, dynamic> map = json.decode(data);
      return BaseEntity.fromJson(map);
    } catch (e) {
      return _defaultErrorEntity;
    }
  }

  /// 默认的错误
  final BaseEntity _defaultErrorEntity =
      BaseEntity(Code.error.code, '接口错误或数据解析失败！', null);
}
