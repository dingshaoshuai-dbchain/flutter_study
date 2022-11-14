import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/util_app/font_family_util.dart';

import '../dss_library/util/font_weiget_util.dart';

class HitRateWidget extends StatelessWidget {
  const HitRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: '准确率',
          style: TextStyle(
            color: AppColors.colorE44D26,
            fontSize: 10.sp,
          ),
        ),
        TextSpan(
          text: '100',
          style: TextStyle(
            color: AppColors.colorE44D26,
            fontSize: 20.sp,
            fontFamily: FontFamilyUtil.din
          ),
        ),
        TextSpan(
          text: ' %',
          style: TextStyle(
            color: AppColors.colorE44D26,
            fontSize: 10.sp,
          ),
        )
      ]),
    );
  }
}
