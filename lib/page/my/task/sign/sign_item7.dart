import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:youliao/dss_library/widgets/basis/container_widget.dart';
import 'package:youliao/dss_library/widgets/basis/image_widget.dart';
import 'package:youliao/dss_library/widgets/basis/text_widget.dart';

import '../../../../dss_library/util/font_weiget_util.dart';

class SignItem7Widget extends StatefulWidget {
  const SignItem7Widget({super.key});

  @override
  State<StatefulWidget> createState() => _SignItem7WidgetState();
}

class _SignItem7WidgetState extends State<SignItem7Widget> {
  Color defaultBackgroundColor = AppColors.mainBackground;
  Color lightBackgroundColor = AppColors.main;

  _State currentState = _State.stateNot;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      height: 80.w,
      backgroundColor: defaultBackgroundColor,
      radiusBottomLeft: 6.w,
      radiusTopLeft: 6.w,
      child: Stack(
        children: [
          TextWidget(
            text: '第7天',
            textColor: AppColors.mainText,
            fontSize: 12.sp,
            marginLeft: 20.w,
            marginTop: 5.w,
            alignment: Alignment.topLeft,
            fontWeight: FontWeightUtil.pingFangSCSemibold,
          ),
          TextWidget(
            text: '神秘大礼包',
            textColor: AppColors.summaryText2,
            fontSize: 10.sp,
            marginLeft: 20.w,
            marginTop: 26.w,
            alignment: Alignment.topLeft,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ImageWidget(
              url: 'ic_gold',
              width: 62.w,
              height: 35.w,
            ),
          ),
        ],
      ),
    );
  }
}

enum _State {
  stateNot,
  stateLight,
  stateSelected,
}
