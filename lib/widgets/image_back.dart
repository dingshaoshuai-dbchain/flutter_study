import 'package:flutter/cupertino.dart';
import 'package:youliao/widgets/basis/round_image.dart';

class ImageBack extends StatelessWidget {
  const ImageBack({super.key, this.isBlack = true});

  final bool isBlack;

  @override
  Widget build(BuildContext context) {
    return RoundImage(
      url: isBlack ? 'common/ic_back_black' : 'common/ic_back_white',
      width: 48,
      height: 48,
      padding: 16,
    );
  }
}
