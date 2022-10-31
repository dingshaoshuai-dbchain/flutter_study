import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/widgets/basis/text_widget.dart';

import '../../../widgets/gaps.dart';
import 'login_text_field_widget.dart';

class PasswordLoginPage extends StatefulWidget {
  const PasswordLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _PasswordLoginPageState();
}

class _PasswordLoginPageState extends State<PasswordLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            hintText: '请输入密码',
            maxLength: 15,
            keyboardType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }
}
