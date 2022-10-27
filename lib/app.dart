import 'package:flutter/material.dart';
import 'package:youliao/init_app/init_app_mode_provider.dart';
import 'package:youliao/init_app/mode/http_init.dart';
import 'package:youliao/init_app/mode/piecemeal_init.dart';
import 'package:youliao/init_app/mode/route_init.dart';
import 'package:youliao/init_app/widget/main_init.dart';
import 'package:youliao/init_app/widget/screen_init.dart';

import 'init_app/init_app_widget_provider.dart';
import 'init_app/widget/ok_toast_init.dart';
import 'main_page.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    List<InitAppModeProvider> list = [
      PiecemealInit(),
      RouteInit(),
      HttpInit(),
    ];
    for (var element in list) {
      element.init();
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<InitAppWidgetProvider> list = [
      MainWidgetInitProvider(),
      OkToastInitProvider(),
      ScreenInitProvider(),
    ];
    Widget child = const MainPage();
    for (var element in list) {
      child = element.init(child);
    }
    return child;
  }
}
