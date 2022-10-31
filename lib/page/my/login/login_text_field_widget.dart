import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/widgets/basis/container_widget.dart';

class LoginTextFieldWidget extends StatefulWidget {
  const LoginTextFieldWidget({
    super.key,
    this.hintText,
    this.maxLength,
    this.keyboardType,
  });

  final String? hintText;
  final int? maxLength;
  final TextInputType? keyboardType;

  @override
  State<StatefulWidget> createState() => _LoginTextFieldWidgetState();
}

class _LoginTextFieldWidgetState extends State<LoginTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      child: TextField(
        decoration: InputDecoration(
            constraints: BoxConstraints(minHeight: 40.w),
            contentPadding:
                EdgeInsets.only(left: 2.w, right: 2.w, top: 3.w, bottom: 13.w),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: AppColors.color_999999,
              fontSize: 16.sp,
            ),
            // 获取焦点后，下方的横线
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.main, width: 1.w)),
            // 未获取焦点并且可用状态，下方的横线
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.color_999999, width: 1.w))),
        style: TextStyle(
          color: AppColors.color_181818,
          fontSize: 16.sp,
        ),
        maxLength: widget.maxLength,
        cursorColor: AppColors.main,
        // 输入类型
        keyboardType: widget.keyboardType,
        // 数字、手机号限制格式为0到9， 密码限制不包含汉字
        inputFormatters: (widget.keyboardType == TextInputType.number ||
                widget.keyboardType == TextInputType.phone)
            ? [FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
            : [FilteringTextInputFormatter.deny(RegExp('[\u4e00-\u9fa5]'))],
        obscureText:
            widget.keyboardType == TextInputType.visiblePassword ? true : false,
        cursorWidth: 1.w,
      ),
    );
  }
}
