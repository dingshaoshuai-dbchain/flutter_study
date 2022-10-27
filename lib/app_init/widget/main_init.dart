import 'package:flutter/material.dart';

import '../../theme/theme_provider.dart';
import '../app_widget_init_provider.dart';

class MainWidgetInit extends AppWidgetInitProvider {
  @override
  Widget init(Widget child) => MaterialApp(
        theme: ThemeProvider().getTheme(),
        home: child,
      );
}
