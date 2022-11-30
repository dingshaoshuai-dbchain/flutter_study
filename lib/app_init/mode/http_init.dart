import 'package:dio/dio.dart';
import 'package:dss_base_flutter/dss_base_flutter.dart';

import '../../global/config.dart';

class HttpInit extends ModeInitProvider {
  @override
  init() {
    final List<Interceptor> interceptors = [];
    interceptors.add(AuthInterceptor());
    if (isDebug) {
      interceptors.add(LoggingInterceptor());
    }
    HttpUtil.instance.init(
      baseUrl: 'https://gateway.yiqiulive.com/',
      interceptors: interceptors,
    );
  }
}
