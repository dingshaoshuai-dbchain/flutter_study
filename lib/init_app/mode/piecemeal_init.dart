import 'package:youliao/global/config.dart';
import 'package:youliao/init_app/init_app_mode_provider.dart';
import 'package:youliao/util/log_utils.dart';

class PiecemealInit extends InitAppModeProvider {
  @override
  init() {
    Log.init(isDebug);
  }
}
