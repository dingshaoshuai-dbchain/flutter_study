import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youliao/routers/my/page/task/task_center_page.dart';
import 'package:youliao/routers/routers.dart';
import 'package:youliao/theme/theme_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    Routes.initRoutes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeProvider().getTheme(),
      home: const TaskCenterPage(),
    );
  }
}


