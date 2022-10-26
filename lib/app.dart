import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    Widget toast = OKToast(
        backgroundColor: Colors.black54,
        textPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom,
        child: app);

    /// 屏幕适配
    Widget screen = ScreenUtilInit(
      /// 设计图尺寸
      designSize: const Size(375, 667),

      /// 是否根据宽度/高度中的最小值适配文字
      minTextAdapt: true,

      /// 支持分屏尺寸
      splitScreenMode: true,
      builder: (_, __) {
        return toast;
      },
    );
    return screen;
  }
}
