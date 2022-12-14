import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:dss_base_flutter/dss_base_flutter.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.margin,
    this.marginHorizontal = 28,
    this.marginVertical,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.onPressed,
  });

  final String text;

  final double? margin;
  final double? marginHorizontal;
  final double? marginVertical;
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;

  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      text: text,
      textColor: Colors.white,
      fontSize: 16.sp,
      fontWeight: FontWeightUtil.pingFangSCSemibold,
      width: 1.sw,
      height: 45.w,
      backgroundColor: AppColors.main,
      radius: 22.5.w,
      margin: (margin)?.w,
      marginHorizontal: (marginHorizontal)?.w,
      marginVertical: (marginVertical)?.w,
      marginTop: (marginTop)?.w,
      marginBottom: (marginBottom)?.w,
      marginLeft: (marginLeft)?.w,
      marginRight: (marginRight)?.w,
      onPressed: onPressed,
    );
  }
}
