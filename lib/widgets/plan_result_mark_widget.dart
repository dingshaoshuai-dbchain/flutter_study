import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dss_base_flutter/dss_base_flutter.dart';

class PlanResultMarkWidget extends StatelessWidget {
  const PlanResultMarkWidget({super.key, required this.hitStatus});

  final num hitStatus;

  @override
  Widget build(BuildContext context) {
    String? icon;
    switch (hitStatus) {
      case 1:
        icon = 'ic_plan_result_red';
        break;
      case 2:
        icon = 'ic_plan_result_black';
        break;
      case 3:
        icon = 'ic_plan_result_zou';
        break;
      default:
        icon = null;
    }
    if (icon == null) {
      return Gaps.empty;
    }
    return Transform.translate(
      offset: const Offset(-20, -25),
      child: ImageWidget(
        url: icon,
        width: 33.w,
        height: 33.w,
      ),
    );
  }
}
