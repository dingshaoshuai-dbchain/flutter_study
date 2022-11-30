import 'package:dss_base_flutter/init_sum.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

/// Toast 配置
class OkToastInitProvider extends WidgetInitProvider {
  @override
  Widget init(Widget child) => OKToast(
      backgroundColor: Colors.black54,
      textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      radius: 20.0,
      position: ToastPosition.bottom,
      child: child);
}
