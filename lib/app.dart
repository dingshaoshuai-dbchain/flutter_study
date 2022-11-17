import 'package:flutter/material.dart';
import 'package:youliao/app_init/mode/http_init.dart';
import 'package:youliao/app_init/mode/piecemeal_init.dart';
import 'package:youliao/app_init/mode/route_init.dart';
import 'package:youliao/app_init/widget/main_init.dart';
import 'package:youliao/app_init/widget/screen_init.dart';

import 'app_init/app_mode_init_provider.dart';
import 'app_init/app_widget_init_provider.dart';
import 'app_init/widget/ok_toast_init.dart';
import 'main_page.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    List<AppModeInitProvider> list = [
      // 杂七杂八的初始化
      PiecemealInit(),
      // 路由初始化
      RouteInit(),
      // 网络初始化
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
      // 主界面
      MainWidgetInit(),
      // Toast
      OkToastInitProvider(),
      // 屏幕适配
      ScreenInit(),
    ];
    Widget child = const MainPage();
    for (var element in list) {
      child = element.init(child);
    }
    return child;
  }
}
