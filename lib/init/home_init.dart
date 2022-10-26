import 'package:flutter/material.dart';
import 'package:youliao/init_provider.dart';

import '../theme/theme_provider.dart';

class HomeInitProvider extends InitProvider {
  @override
  Widget init(Widget child) => MaterialApp(
        theme: ThemeProvider().getTheme(),
        home: child,
      );
}
