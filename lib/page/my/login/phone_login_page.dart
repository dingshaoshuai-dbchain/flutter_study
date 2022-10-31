import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/util/toast_util.dart';
import 'package:youliao/widgets/gaps.dart';
import 'package:youliao/widgets_app/AppButton.dart';

import 'login_text_field_widget.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w),
        child: Column(
          children: [
            LoginTextFieldWidget(
              hintText: '请输入手机号码',
              maxLength: 11,
              keyboardType: TextInputType.phone,
            ),
            Gaps.vGapValue(22.w),
            LoginTextFieldWidget(
              hintText: '请输入验证码',
              maxLength: 6,
              keyboardType: TextInputType.number,
            ),
            Gaps.vGapValue(22.w),
            LoginTextFieldWidget(
              hintText: '请输入邀请码（可不填写）',
              maxLength: 10,
              keyboardType: TextInputType.text,
            ),
            AppButton(
              text: '登录',
              marginTop: 40,
              marginHorizontal: 0,
              onPressed: () => {Toast.show('登录')},
            )
          ],
        ),
      ),
    );
  }
}
