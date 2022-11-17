import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:youliao/dss_library/widgets/basis/container_widget.dart';
import 'package:youliao/dss_library/widgets/basis/image_widget.dart';
import 'package:youliao/dss_library/widgets/basis/text_widget.dart';

import '../../../../dss_library/util/font_weiget_util.dart';

class SignItemWidget extends StatefulWidget {
  const SignItemWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SignItemWidgetState();
}

class _SignItemWidgetState extends State<SignItemWidget> {
  Color defaultBackgroundColor = AppColors.mainBackground;
  Color lightBackgroundColor = AppColors.main;

  _State currentState = _State.stateNot;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      height: 80.w,
      backgroundColor: defaultBackgroundColor,
      radius: 6.w,
      child: Stack(
        children: [
          TextWidget(
            text: '第1天',
            textColor: AppColors.mainText,
            fontSize: 12.sp,
            marginTop: 5.w,
            alignment: Alignment.topCenter,
            fontWeight: FontWeightUtil.pingFangSCSemibold,
          ),
          TextWidget(
            text: '10金币',
            textColor: AppColors.summaryText2,
            fontSize: 10.sp,
            marginBottom: 8.w,
            alignment: Alignment.bottomCenter,
          ),
          Align(
            alignment: Alignment.center,
            child: ImageWidget(
              url: 'ic_gold',
              width: 24.w,
              height: 24.w,
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
