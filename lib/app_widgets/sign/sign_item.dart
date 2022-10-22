import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/app_res/app_colors.dart';
import 'package:youliao/widgets/basis/round_container.dart';
import 'package:youliao/widgets/basis/round_image.dart';
import 'package:youliao/widgets/basis/round_text.dart';

class SignItemWidget extends StatefulWidget {
  const SignItemWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SignItemWidgetState();
}

class _SignItemWidgetState extends State<SignItemWidget> {
  Color defaultBackgroundColor = AppColors.colorF5F5F5;
  Color lightBackgroundColor = AppColors.main;

  _State currentState = _State.stateNot;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      height: 80,
      backgroundColor: defaultBackgroundColor,
      radius: 6,
      child: Stack(
        children: const [
          RoundText(
            text: '第1天',
            textColor: AppColors.color_181818,
            fontSize: 12,
            marginTop: 5,
            alignment: Alignment.topCenter,
            fontWeight: FontWeight.w600,
          ),
          RoundText(
            text: '10金币',
            textColor: AppColors.color_999999,
            fontSize: 10,
            marginBottom: 8,
            alignment: Alignment.bottomCenter,
          ),
          Align(
            alignment: Alignment.center,
            child: RoundImage(
              url: 'app/ic_gold',
              width: 24,
              height: 24,
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
