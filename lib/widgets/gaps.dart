import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/dimens.dart';

/// 间隔
/// 官方做法：https://github.com/flutter/flutter/pull/54394
class Gaps {
  /// 水平间隔
  static Widget hGapValue(double value) => SizedBox(width: value);
  static const Widget hGap2 = SizedBox(width: Dimens.gap_dp2);
  static const Widget hGap4 = SizedBox(width: Dimens.gap_dp4);
  static const Widget hGap5 = SizedBox(width: Dimens.gap_dp5);
  static const Widget hGap8 = SizedBox(width: Dimens.gap_dp8);
  static const Widget hGap10 = SizedBox(width: Dimens.gap_dp10);
  static const Widget hGap12 = SizedBox(width: Dimens.gap_dp12);
  static const Widget hGap15 = SizedBox(width: Dimens.gap_dp15);
  static const Widget hGap16 = SizedBox(width: Dimens.gap_dp16);
  static const Widget hGap32 = SizedBox(width: Dimens.gap_dp32);

  /// 垂直间隔
  static Widget vGapValue(double value) => SizedBox(height: value);
  static const Widget vGap4 = SizedBox(height: Dimens.gap_dp4);
  static const Widget vGap5 = SizedBox(height: Dimens.gap_dp5);
  static const Widget vGap8 = SizedBox(height: Dimens.gap_dp8);
  static const Widget vGap10 = SizedBox(height: Dimens.gap_dp10);
  static const Widget vGap12 = SizedBox(height: Dimens.gap_dp12);
  static const Widget vGap15 = SizedBox(height: Dimens.gap_dp15);
  static const Widget vGap16 = SizedBox(height: Dimens.gap_dp16);
  static const Widget vGap24 = SizedBox(height: Dimens.gap_dp24);
  static const Widget vGap32 = SizedBox(height: Dimens.gap_dp32);
  static const Widget vGap50 = SizedBox(height: Dimens.gap_dp50);

  static Widget line = Divider(
    indent: 48.w,
    endIndent: 31.w,
  );

  static const Widget empty = SizedBox.shrink();

  static Widget hLine({
    double? indent,
    double? endIndent,
    Color? color,
    // 线条的厚度
    double? thickness = 0.5,
    // 高度（间距）
    double? height = 0.5,
  }) =>
      Divider(
        indent: indent,
        endIndent: endIndent,
        color: color ?? const Color(0xFFF1F1F1),
        thickness: thickness,
        height: height,
      );

  static Widget vLine({
    // 上下间距
    double? indent = 0,
    double? endIndent = 0,
    Color? color,
    // 线条的厚度
    double? thickness = 0.5,
    // 高度（间距）
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
        ));
  }

  /// 补充一种空Widget实现 https://github.com/letsar/nil
  /// https://github.com/flutter/flutter/issues/78159
}
