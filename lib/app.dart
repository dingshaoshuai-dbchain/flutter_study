import 'package:flutter/material.dart';

import 'main_page.dart';
import 'page/routers.dart';
import 'theme/theme_provider.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    Routes.initRoutes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeProvider().getTheme(),
      home: const MainPage(),
    );
  }
}
