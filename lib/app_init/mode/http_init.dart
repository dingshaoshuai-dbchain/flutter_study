import 'package:dio/dio.dart';

import '../../dss_library/net/http_util.dart';
import '../../dss_library/net/intercepts.dart';
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
