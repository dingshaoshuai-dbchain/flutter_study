import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

/// 一些功能模块的初始化
abstract class ModeInitProvider {
  init();
}

/// 布局相关的初始化
abstract class WidgetInitProvider {
  Widget init(Widget child);
}

/// 路由相关的初始化
abstract class RouterInitProvider {
  void init(FluroRouter router);
}
