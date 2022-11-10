import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/util/navigator_util.dart';
import 'package:youliao/widgets/basis/image_widget.dart';

class ImageBack extends StatelessWidget {
  const ImageBack({
    super.key,
    this.isBlack = true,
    this.onPressed,
  });

  final bool isBlack;

  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      url: isBlack ? 'common/ic_back_black' : 'common/ic_back_white',
      width: 48,
      height: 48,
      padding: 16,
      // TODO 不知道为毛，死难点到
      onPressed: onPressed ??
          () {
            NavigatorUtil.goBack(context);
          },
    );
  }
}
