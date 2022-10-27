import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/basis/image_widget.dart';
import 'package:youliao/widgets/basis/text_widget.dart';

class SignItem7Widget extends StatefulWidget {
  const SignItem7Widget({super.key});

  @override
  State<StatefulWidget> createState() => _SignItem7WidgetState();
}

class _SignItem7WidgetState extends State<SignItem7Widget> {
  Color defaultBackgroundColor = AppColors.colorF5F5F5;
  Color lightBackgroundColor = AppColors.main;

  _State currentState = _State.stateNot;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      height: 80,
      backgroundColor: defaultBackgroundColor,
      radius: 6,
      child: Stack(
        children: [
          TextWidget(
            text: '第7天',
            textColor: AppColors.color_181818,
            fontSize: 12,
            marginLeft: 20,
            marginTop: 5,
            alignment: Alignment.topLeft,
            fontWeight: FontWeight.w600,
          ),
          TextWidget(
            text: '神秘大礼包',
            textColor: AppColors.color_999999,
            fontSize: 10,
            marginLeft: 20,
            marginTop: 26,
            alignment: Alignment.topLeft,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ImageWidget(
              url: 'app/ic_gold',
              width: 62,
              height: 35,
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
