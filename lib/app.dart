import 'package:flutter/material.dart';
import 'package:youliao/app_init/mode/http_init.dart';
import 'package:youliao/app_init/mode/piecemeal_init.dart';
import 'package:youliao/app_init/mode/route_init.dart';
import 'package:youliao/app_init/widget/main_init.dart';
import 'package:youliao/app_init/widget/screen_init.dart';
import 'package:youliao/page/my/login/login_page.dart';

import 'app_init/app_mode_init_provider.dart';
import 'app_init/app_widget_init_provider.dart';
import 'app_init/widget/ok_toast_init.dart';
import 'main_page.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    List<AppModeInitProvider> list = [
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
    List<AppWidgetInitProvider> list = [
      MainWidgetInit(),
      OkToastInitProvider(),
      ScreenInit(),
    ];
    Widget child = const LoginPage();
    for (var element in list) {
      child = element.init(child);
    }
    return child;
  }
}
