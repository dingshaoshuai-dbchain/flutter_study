import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:youliao/util/font_family_util.dart';

class HitRateWidget extends StatelessWidget {
  const HitRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: '准确率',
          style: TextStyle(
            color: AppColors.rate,
            fontSize: 10.sp,
          ),
        ),
        TextSpan(
          text: '100',
          style: TextStyle(
            color: AppColors.rate,
            fontSize: 20.sp,
            fontFamily: FontFamilyUtil.din
          ),
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
