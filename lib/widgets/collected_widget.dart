import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dss_base_flutter/dss_base_flutter.dart';

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
          ? 'ic_collected_checked'
          : 'ic_collected_normal',
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
