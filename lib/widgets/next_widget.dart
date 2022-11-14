import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dss_library/widgets/basis/image_widget.dart';

class NextWidget extends StatelessWidget {
  const NextWidget({
    super.key,
    this.margin,
    this.marginHorizontal,
    this.marginVertical,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
  });

  final double? margin;
  final double? marginHorizontal;
  final double? marginVertical;
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      url: 'common/ic_next_page',
      width: 6.w,
      height: 10.w,
      margin: margin,
      marginHorizontal: marginHorizontal,
      marginVertical: marginVertical,
      marginTop: marginTop,
      marginBottom: marginBottom,
      marginLeft: marginLeft,
      marginRight: marginRight,
    );
  }
}
