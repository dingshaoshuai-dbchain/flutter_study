import 'package:youliao/global/config.dart';

import '../../dss_library/util/log_utils.dart';
import '../app_mode_init_provider.dart';

class PiecemealInit extends AppModeInitProvider {
  @override
  init() {
    Log.init(isDebug);
  }
}
