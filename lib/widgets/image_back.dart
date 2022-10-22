import 'package:flutter/cupertino.dart';
import 'package:youliao/widgets/basis/round_image.dart';

class ImageBack extends StatelessWidget {
  const ImageBack({
    super.key,
    this.isBlack = true,
    this.onTap,
  });

  final bool isBlack;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RoundImage(
      url: isBlack ? 'common/ic_back_black' : 'common/ic_back_white',
      width: 48,
      height: 48,
      padding: 16,
      onTap: onTap,
    );
  }
}
