import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/widgets/basis/text_widget.dart';

/// 足球赛事牌子
abstract class BaseFootballCard extends StatelessWidget {
  const BaseFootballCard(
      {super.key, required this.backgroundColor, required this.number});

  final Color backgroundColor;
  final int number;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: '$number',
      textColor: Colors.white,
      fontSize: 10.sp,
      backgroundColor: backgroundColor,
      radius: 2.w,
      width: 10.w,
      height: 12.w,
      fontWeight: FontWeight.w600,
    );
  }
}

/// 足球赛事牌子 - 黄牌
class YellowCard extends BaseFootballCard {
  const YellowCard({super.key, required super.number})
      : super(backgroundColor: AppColors.footballMatchYellow);
}

/// 足球赛事牌子 - 红牌
class RedCard extends BaseFootballCard {
  const RedCard({super.key, required super.number})
      : super(backgroundColor: AppColors.footballMatchRed);
}
