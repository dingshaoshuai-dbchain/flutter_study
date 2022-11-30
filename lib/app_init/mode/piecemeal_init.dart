import 'package:youliao/global/config.dart';

import 'package:dss_base_flutter/dss_base_flutter.dart';

class PiecemealInit extends ModeInitProvider {
  @override
  init() {
    Log.init(isDebug);
  }
}
