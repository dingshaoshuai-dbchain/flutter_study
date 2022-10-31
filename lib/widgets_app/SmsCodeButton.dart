import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';

import '../widgets/basis/text_widget.dart';

class SmsCodeButton extends StatefulWidget {
  const SmsCodeButton({super.key});

  @override
  State<StatefulWidget> createState() => _SmsCodeButtonState();
}

class _SmsCodeButtonState extends State<SmsCodeButton> {
  Color normalColor = const Color(0xFFE8F5E9);

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: '获取验证码',
      textColor: AppColors.main,
      fontSize: 11.sp,
      radius: 12.w,
      backgroundColor: normalColor,
      width: 74.w,
      height: 24.w,
    );
  }
}
