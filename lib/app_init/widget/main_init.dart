import 'package:dss_base_flutter/init_sum.dart';
import 'package:flutter/material.dart';

import '../../theme/theme_provider.dart';

class MainWidgetInit extends WidgetInitProvider {
  @override
  Widget init(Widget child) => MaterialApp(
        theme: ThemeProvider().getTheme(),
        home: child,
      );
}
