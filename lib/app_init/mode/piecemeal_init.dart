import 'package:youliao/global/config.dart';

import 'package:dss_base_flutter/dss_base_flutter.dart';
import '../app_mode_init_provider.dart';

class PiecemealInit extends AppModeInitProvider {
  @override
  init() {
    Log.init(isDebug);
  }
}
