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
  Color defaultBackgroundColor = const Color(0xFFF5F6FA);
  Color lightBackgroundColor = const Color(0xFF63C385);

  _State currentState = _State.stateNot;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      backgroundColor: defaultBackgroundColor,
      radius: 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          RoundText(
            text: '第1天',
            textColor: AppColors.color_181818,
            fontSize: 12,
            marginBottom: 7,
          ),
          RoundImage(
            url: 'app/ic_gold',
            width: 24,
            height: 24,
          ),
          RoundText(
            text: '10金币',
            textColor: AppColors.color_999999,
            fontSize: 10,
            marginTop: 7,
          )
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
