import 'package:youliao/init_app/init_app_mode_provider.dart';
import 'package:youliao/net/http_util.dart';
import 'package:youliao/net/intercepts.dart';

class HttpInit extends InitAppModeProvider {
  @override
  init() {
    HttpUtil.instance.init(
      baseUrl: 'baseUrl',
      interceptors: [
        AuthInterceptor(),
      ],
    );
  }
}
