import 'package:flutter/material.dart';
import 'package:youliao/init/home_init.dart';
import 'package:youliao/init/ok_toast_init.dart';
import 'package:youliao/init/screen_init.dart';

import 'init_provider.dart';
import 'main_page.dart';
import 'page/routers.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    Routes.initRoutes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<InitProvider> list = [];
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
