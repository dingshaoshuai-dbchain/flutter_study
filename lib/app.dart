import 'package:flutter/material.dart';
import 'package:youliao/init_app_widget/home_init.dart';
import 'package:youliao/init_app_widget/ok_toast_init.dart';
import 'package:youliao/init_app_widget/screen_init.dart';

import 'app_widget_init_provider.dart';
import 'main_page.dart';
import 'page/routers.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    Routes.initRoutes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<AppWidgetInitProvider> list = [];
    list.add(HomeInitProvider());
    list.add(OkToastInitProvider());
    list.add(ScreenInitProvider());

    Widget child = const MainPage();
    for (var element in list) {
      child = element.init(child);
    }
    return child;
  }
}
