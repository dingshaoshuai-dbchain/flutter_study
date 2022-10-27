import 'package:youliao/init_app/init_app_mode_provider.dart';
import 'package:youliao/page/routers.dart';

class RouteInit extends InitAppModeProvider {
  @override
  init() {
    Routes.instance.init();
  }
}
