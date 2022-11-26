import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dss_library/widgets/basis/container_widget.dart';
import '../dss_library/widgets/basis/text_widget.dart';
import '../res/app_colors.dart';

/// 方案数量 widget
class PlanNumberWidget extends StatelessWidget {
  final double? marginRight;

  const PlanNumberWidget({super.key, this.marginRight});

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      marginRight: marginRight,
      backgroundColor: AppColors.main,
      width: 38.w,
      height: 12.w,
      radius: 2.w,
      child: Row(
        children: [
          Expanded(
            child: TextWidget(
              text: '专家',
              textColor: Colors.white,
              fontSize: 7.sp,
            ),
          ),
          Expanded(
            child: TextWidget(
              text: '10',
              textColor: AppColors.main,
              fontSize: 7.sp,
              backgroundColor: Colors.white,
              marginVertical: 1.w,
              marginRight: 1.w,
              radiusTopRight: 2.w,
              radiusBottomRight: 2.w,
            ),
          )
        ],
      ),
    );
  }
}
