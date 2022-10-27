import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:oktoast/oktoast.dart';
import 'package:youliao/init_app/init_app_widget_provider.dart';

/// Toast 配置
class OkToastInitProvider extends InitAppWidgetProvider {
  @override
  Widget init(Widget child) => OKToast(
      backgroundColor: Colors.black54,
      textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      radius: 20.0,
      position: ToastPosition.bottom,
      child: child);
}
