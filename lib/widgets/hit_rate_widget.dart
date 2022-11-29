import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:youliao/util/font_family_util.dart';

class HitRateWidget extends StatelessWidget {
  const HitRateWidget({super.key, required this.number, required this.rate});

  final num number;
  final num rate;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: '近$number场命中率 ',
          style: TextStyle(
            color: AppColors.rate,
            fontSize: 10.sp,
          ),
        ),
        TextSpan(
          text: '$rate',
          style: TextStyle(
              color: AppColors.rate,
              fontSize: 20.sp,
              fontFamily: FontFamilyUtil.din),
        ),
        TextSpan(
          text: ' %',
          style: TextStyle(
            color: AppColors.rate,
            fontSize: 10.sp,
          ),
        )
      ]),
    );
  }
}
