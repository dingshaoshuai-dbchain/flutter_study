import 'package:dio/dio.dart';

class HttpUtil {
  HttpUtil._();

  static final HttpUtil _singleton = HttpUtil._();

  factory HttpUtil() => _singleton;

  static HttpUtil get instance => _singleton;

  late final Dio _dio;

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

  Future<void> request(String path) async {
    Response response = await _dio.request(path);
  }
}
