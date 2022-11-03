import 'package:dio/dio.dart';
import 'package:youliao/net/http_util.dart';
import 'package:youliao/net/intercepts.dart';

import '../../global/config.dart';
import '../app_mode_init_provider.dart';

class HttpInit extends AppModeInitProvider {
  @override
  init() {
    final List<Interceptor> interceptors = [];
    interceptors.add(AuthInterceptor());
    if (!isDebug) {
      interceptors.add(LoggingInterceptor());
    }
    HttpUtil.instance.init(
      baseUrl: 'https://gateway.yiqiulive.com/',
      interceptors: interceptors,
    );
  }
}
