import 'package:dio/dio.dart';
import 'package:youliao/init_app/init_app_mode_provider.dart';
import 'package:youliao/net/http_util.dart';
import 'package:youliao/net/intercepts.dart';

import '../../global/config.dart';

class HttpInit extends InitAppModeProvider {
  @override
  init() {
    final List<Interceptor> interceptors = [];
    interceptors.add(AuthInterceptor());
    if (!isDebug) {
      interceptors.add(LoggingInterceptor());
    }
    HttpUtil.instance.init(
      baseUrl: 'baseUrl',
      interceptors: interceptors,
    );
  }
}
