import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res/colors.dart';
import 'package:youliao/widgets/basis/text_widget.dart';
import 'package:youliao/widgets/image_back.dart';

class AppBarCommon extends StatelessWidget {
  AppBarCommon({
    super.key,
    required this.title,
    this.isShowBack = true,
    this.titleColor = Colors.color_181818,
    this.titleFontSize = 18,
    this.titleFontWeight = FontWeight.w600,
  });

  final String title;
  final Color titleColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;

  final bool isShowBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 48.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Row(
              children: [
                if (isShowBack) ImageBack(),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: TextWidget(
              text: title ?? '',
              textColor: titleColor,
              fontSize: titleFontSize,
              fontWeight: titleFontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
