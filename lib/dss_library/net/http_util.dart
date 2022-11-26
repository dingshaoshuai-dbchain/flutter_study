import 'dart:convert';

import 'package:dio/dio.dart';

import 'base_entity.dart';

typedef NetSuccessCallback = Function(dynamic data);
typedef NetSuccessTCallback<T> = Function(T data);
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

  Future<BaseEntity> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) {
    return _request(
      url: url,
      method: methodGet,
      queryParameters: queryParameters,
    );
  }

  void getCallback({
    required String url,
    Map<String, dynamic>? queryParameters,
    required NetSuccessCallback onSuccess,
    required NetFailureCallback onFailure,
  }) {
    get(
      url: url,
      queryParameters: queryParameters,
    ).then((BaseEntity value) {
      if (value.code == netSuccessCode) {
        onSuccess(value.data);
      } else {
        onFailure(value.code, value.msg ?? '操作失败');
      }
    });
  }

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
      return BaseEntity(netFailureCode, '接口错误或数据解析失败！', null);
    }
  }
}
