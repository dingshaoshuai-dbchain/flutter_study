import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/widgets/basis/text_widget.dart';

class HotMatchIndexPage extends StatelessWidget {
  const HotMatchIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: '热门',
      textColor: AppColors.color_181818,
      fontSize: 20,
    );
  }
}
