import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/widgets/gaps.dart';
import 'package:youliao/widgets_app/plan_item.dart';

class PlanItemListWidget extends StatelessWidget {
  const PlanItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 30,
      padding: EdgeInsets.only(left: 9.w, right: 9.w),
      itemBuilder: (BuildContext context, int index) {
        return PlanItemWidget(
          marginTop: index == 0 ? 10.w : 0.0,
          marginBottom: index == 30 - 1 ? 10.w : 0.0,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Gaps.vGapValue(8.w);
      },
    );
  }
}
