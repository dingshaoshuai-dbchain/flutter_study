import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dss_library/widgets/basis/image_widget.dart';

class CollectedWidget extends StatefulWidget {
  const CollectedWidget({super.key});

  @override
  State<StatefulWidget> createState() => _CollectedWidgetState();
}

class _CollectedWidgetState extends State<CollectedWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      url: _isChecked
          ? 'match/ic_collected_checked'
          : 'match/ic_collected_normal',
      width: 33.w,
      height: 33.w,
      padding: 10.w,
      onPressed: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
    );
  }
}
