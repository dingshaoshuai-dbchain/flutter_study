import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/api/user_api.dart';
import 'package:youliao/global/length_config.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:youliao/util/edit_check.dart';
import 'package:youliao/dss_library/widgets/basis/text_widget.dart';
import 'package:youliao/dss_library/widgets/gaps.dart';
import 'package:youliao/widgets/app_button.dart';

import '../../../dss_library/util/log_utils.dart';
import '../../../widgets/sms_code_button.dart';
import 'login_text_field_widget.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  final TextEditingController _phoneController = TextEditingController(
    text: "13823188079",
  );
  final TextEditingController _smsCodeController =
      TextEditingController(text: "999999");
  final TextEditingController _inviteCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Log.d('build - PhoneLoginPage');
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 28.w, right: 28.w),
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  bottom: 13.w,
                  child: TextWidget(
                      text: '中国 +86',
                      textColor: AppColors.mainText,
                      alignment: Alignment.topLeft,
                      fontSize: 16.sp),
                ),
                // 手机号
                LoginTextFieldWidget(
                  hintText: '请输入手机号码',
                  maxLength: phoneLength,
                  paddingLeft: 75,
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                )
              ],
            ),
            Gaps.vGapValue(22.w),
            Stack(
              children: [
                // 验证码
                LoginTextFieldWidget(
                  hintText: '请输入验证码',
                  maxLength: smsCodeLength,
                  keyboardType: TextInputType.number,
                  controller: _smsCodeController,
                ),
                Positioned(
                  bottom: 13.w,
                  right: 0,
                  child: SmsCodeButton(
                    getSmsCodeF: () {
                      return Future(() {
                        if (checkPhone(_phoneController.text)) return false;
                        return true;
                      });
                    },
                  ),
                )
              ],
            ),
            Gaps.vGapValue(22.w),
            // 邀请码
            LoginTextFieldWidget(
              hintText: '请输入邀请码（可不填写）',
              maxLength: inviteCodeLength,
              keyboardType: TextInputType.text,
              controller: _inviteCodeController,
            ),
            AppButton(
              text: '登录',
              marginTop: 40,
              marginHorizontal: 0,
              onPressed: () {
                Future(() {
                  if (checkPhone(_phoneController.text)) return;
                  if (checkSmsCode(_smsCodeController.text)) return;
                  UserApi.instance.loginByPhone(
                    _phoneController.text,
                    _smsCodeController.text,
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
