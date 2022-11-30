import 'dart:ui';

import 'package:flutter/material.dart';

class StatusBarUtil {
  /// 获取状态栏高度
  static double getStatusBarHeight() => MediaQueryData.fromWindow(window).padding.top;
}
