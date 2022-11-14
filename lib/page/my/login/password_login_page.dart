import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/dss_library/widgets/basis/image_widget.dart';
import 'package:youliao/dss_library/widgets/basis/text_compose_widget.dart';
import 'package:youliao/dss_library/widgets/basis/text_widget.dart';

import '../../../dss_library/util/toast_util.dart';
import '../../../global/length_config.dart';
import '../../../res_app/app_colors.dart';
import '../../../dss_library/widgets/gaps.dart';
import '../../../widgets_app/app_button.dart';
import 'login_text_field_widget.dart';

class PasswordLoginPage extends StatefulWidget {
  const PasswordLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _PasswordLoginPageState();
}

class _PasswordLoginPageState extends State<PasswordLoginPage> {
  bool _isSavePassword = false;

  @override
  Widget build(BuildContext context) {
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
                      textColor: AppColors.color_181818,
                      alignment: Alignment.topLeft,
                      fontSize: 16.sp),
                ),
                LoginTextFieldWidget(
                  hintText: '请输入手机号码',
                  maxLength: phoneLength,
                  paddingLeft: 75,
                  keyboardType: TextInputType.phone,
                )
              ],
            ),
            Gaps.vGapValue(22.w),
            LoginTextFieldWidget(
              hintText: '请输入密码',
              maxLength: passwordLength,
              keyboardType: TextInputType.visiblePassword,
            ),
            Row(
              children: [
                TextComposeWidget(
                  text: '记住密码',
                  textColor: AppColors.color_999999,
                  fontSize: 13.sp,
                  paddingVertical: 17.w,
                  leftWidget: ImageWidget(
                    url: _isSavePassword
                        ? 'app/ic_checkbox_checked'
                        : 'app/ic_checkbox_normal',
                    width: 13.w,
                    height: 13.w,
                    marginRight: 6.w,
                  ),
                  onPressed: () {
                    setState(() {
                      _isSavePassword = !_isSavePassword;
                    });
                  },
                ),
                Spacer(),
                TextWidget(
                  text: '忘记密码',
                  textColor: AppColors.color_999999,
                  fontSize: 13.sp,
                  paddingVertical: 17.w,
                  onPressed: () {
                    Toast.show('忘记密码');
                  },
                ),
              ],
            ),
            Gaps.vGapValue(22.w),
            AppButton(
              text: '登录',
              marginTop: 50,
              marginHorizontal: 0,
              onPressed: () {
                Toast.show('登录');
              },
            )
          ],
        ),
      ),
    );
  }
}
