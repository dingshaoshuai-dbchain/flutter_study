import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youliao/res_app/app_colors.dart';

import 'app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // 状态栏透明
      statusBarColor: Colors.transparent,
      // 状态栏字体颜色
      statusBarIconBrightness: Brightness.dark,
      // 底部导航栏颜色
      systemNavigationBarColor: AppColors.mainBackground,
    ),
  );
  runApp(MyApp());
}




