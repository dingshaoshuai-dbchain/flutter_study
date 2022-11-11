import 'package:flutter/material.dart';

/// 间隔
/// 官方做法：https://github.com/flutter/flutter/pull/54394
class Gaps {
  /// 水平间隔
  static Widget hGapValue(double value) => SizedBox(width: value);
  static const Widget hGap1 = SizedBox(width: 1);
  static const Widget hGap2 = SizedBox(width: 2);
  static const Widget hGap3 = SizedBox(width: 3);
  static const Widget hGap4 = SizedBox(width: 4);
  static const Widget hGap5 = SizedBox(width: 5);
  static const Widget hGap6 = SizedBox(width: 6);
  static const Widget hGap7 = SizedBox(width: 7);
  static const Widget hGap8 = SizedBox(width: 8);
  static const Widget hGap9 = SizedBox(width: 9);
  static const Widget hGap10 = SizedBox(width: 10);
  static const Widget hGap11 = SizedBox(width: 11);
  static const Widget hGap12 = SizedBox(width: 12);
  static const Widget hGap13 = SizedBox(width: 13);
  static const Widget hGap14 = SizedBox(width: 14);
  static const Widget hGap15 = SizedBox(width: 15);
  static const Widget hGap16 = SizedBox(width: 16);
  static const Widget hGap17 = SizedBox(width: 17);
  static const Widget hGap18 = SizedBox(width: 18);
  static const Widget hGap19 = SizedBox(width: 19);
  static const Widget hGap20 = SizedBox(width: 20);

  /// 垂直间隔
  static Widget vGapValue(double value) => SizedBox(height: value);
  static const Widget vGap1 = SizedBox(height: 1);
  static const Widget vGap2 = SizedBox(height: 2);
  static const Widget vGap3 = SizedBox(height: 3);
  static const Widget vGap4 = SizedBox(height: 4);
  static const Widget vGap5 = SizedBox(height: 5);
  static const Widget vGap6 = SizedBox(height: 6);
  static const Widget vGap7 = SizedBox(height: 7);
  static const Widget vGap8 = SizedBox(height: 8);
  static const Widget vGap9 = SizedBox(height: 9);
  static const Widget vGap10 = SizedBox(height: 10);
  static const Widget vGap11 = SizedBox(height: 11);
  static const Widget vGap12 = SizedBox(height: 12);
  static const Widget vGap13 = SizedBox(height: 13);
  static const Widget vGap14 = SizedBox(height: 14);
  static const Widget vGap15 = SizedBox(height: 15);
  static const Widget vGap16 = SizedBox(height: 16);
  static const Widget vGap17 = SizedBox(height: 17);
  static const Widget vGap18 = SizedBox(height: 18);
  static const Widget vGap19 = SizedBox(height: 19);
  static const Widget vGap20 = SizedBox(height: 20);

  static const Widget empty = SizedBox.shrink();

  /// 水平线条
  static Widget hLine({
    // 左右间距
    double? indent,
    double? endIndent,
    Color? color,
    // 线条的厚度
    double? thickness = 0.5,
    // 高度（内间距）
    double? height = 0.5,
  }) {
    return Divider(
      indent: indent,
      endIndent: endIndent,
      color: color ?? const Color(0xFFF1F1F1),
      thickness: thickness,
      height: height,
    );
  }

  /// 垂直线条
  static Widget vLine({
    // 上下间距
    double? indent = 0,
    double? endIndent = 0,
    Color? color,
    // 线条的厚度
    double? thickness = 0.5,
    // 高度（内间距）
    double? height = double.infinity,
  }) {
    return SizedBox(
      width: 0.5,
      height: height,
      child: VerticalDivider(
        indent: indent,
        endIndent: endIndent,
        color: color ?? const Color(0xFFF1F1F1),
        thickness: thickness,
      ),
    );
  }

  /// 补充一种空Widget实现 https://github.com/letsar/nil
  /// https://github.com/flutter/flutter/issues/78159
}
