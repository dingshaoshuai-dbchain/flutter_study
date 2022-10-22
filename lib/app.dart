import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

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
    Widget app =  MaterialApp(
      theme: ThemeProvider().getTheme(),
      home: const MainPage(),
    );
    /// Toast 配置
    return OKToast(
        backgroundColor: Colors.black54,
        textPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom,
        child: app);
  }
}
