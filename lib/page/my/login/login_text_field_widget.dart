import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/dss_library/widgets/basis/image_widget.dart';

import '../../../res_app/app_colors.dart';

class LoginTextFieldWidget extends StatefulWidget {
  const LoginTextFieldWidget({
    super.key,
    this.hintText,
    this.maxLength,
    this.keyboardType,
    this.paddingLeft,
    this.controller,
  });

  final String? hintText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final int? paddingLeft;
  final TextEditingController? controller;

  @override
  State<StatefulWidget> createState() => _LoginTextFieldWidgetState();
}

class _LoginTextFieldWidgetState extends State<LoginTextFieldWidget> {
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    Widget textField = TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          constraints: BoxConstraints(minHeight: 40.w),
          contentPadding: EdgeInsets.only(
              left: widget.paddingLeft?.w ?? 2.w,
              right: 2.w,
              top: 3.w,
              bottom: 5.w),
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
              borderSide: BorderSide(color: AppColors.colorDADADA, width: 1.w)),
          // 去掉最大长度显示
          counterText: ""),
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
          widget.keyboardType == TextInputType.visiblePassword && !_isShow,
      cursorWidth: 1.w,
    );
    Widget value = Stack(
      alignment: Alignment.centerRight,
      children: [
        textField,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.keyboardType == TextInputType.visiblePassword)
              _buildVisible(context)
          ],
        )
      ],
    );
    return value;
  }

  Widget _buildVisible(BuildContext context) {
    return ImageWidget(
      url: _isShow ? 'common/ic_edit_hide' : 'common/ic_edit_show',
      width: 30.w,
      height: 30.w,
      padding: 5.w,
      onPressed: () {
        setState(() {
          _isShow = !_isShow;
        });
      },
    );
  }
}
