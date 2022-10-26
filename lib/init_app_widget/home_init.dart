import 'package:flutter/material.dart';
import 'package:youliao/app_widget_init_provider.dart';

import '../theme/theme_provider.dart';

class HomeInitProvider extends AppWidgetInitProvider {
  @override
  Widget init(Widget child) => MaterialApp(
        theme: ThemeProvider().getTheme(),
        home: child,
      );
}
