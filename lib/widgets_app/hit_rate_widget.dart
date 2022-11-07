import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';

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
              fontWeight: FontWeight.w600),
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
