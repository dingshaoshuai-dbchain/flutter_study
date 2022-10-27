import 'package:flutter/material.dart';
import 'package:youliao/init_app/init_app_widget_provider.dart';

import '../../theme/theme_provider.dart';

class MainWidgetInitProvider extends InitAppWidgetProvider {
  @override
  Widget init(Widget child) => MaterialApp(
        theme: ThemeProvider().getTheme(),
        home: child,
      );
}
