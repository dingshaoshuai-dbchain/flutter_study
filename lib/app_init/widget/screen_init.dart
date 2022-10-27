import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_widget_init_provider.dart';

/// Toast 配置
class ScreenInit extends AppWidgetInitProvider {
  @override
  Widget init(Widget child) => ScreenUtilInit(
        /// 设计图尺寸
        designSize: const Size(375, 667),

        /// 是否根据宽度/高度中的最小值适配文字
        minTextAdapt: true,

        /// 支持分屏尺寸
        splitScreenMode: true,
        builder: (_, __) {
          return child;
        },
      );
}
