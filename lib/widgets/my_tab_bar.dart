import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/app_colors.dart';
import 'package:dss_base_flutter/dss_base_flutter.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    super.key,
    required this.pageController,
    required this.titles,
    this.radiusTopLeft,
    this.radiusTopRight,
  });

  final TabController pageController;
  final List<String> titles;

  final double? radiusTopLeft;
  final double? radiusTopRight;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      width: double.infinity,
      backgroundColor: Colors.white,
      radiusTopRight: radiusTopLeft ?? 8.w,
      radiusTopLeft: radiusTopLeft ?? 8.w,
      child: TabBar(
        padding:
            EdgeInsets.only(top: 13.w, bottom: 13.w, left: 10.w, right: 10.w),
        controller: pageController,
        labelColor: AppColors.mainText,
        labelStyle: TextStyle(
          // fontSize: 15.sp,
          fontWeight: FontWeightUtil.pingFangSCSemibold,
        ),
        unselectedLabelColor: AppColors.mainText,
        unselectedLabelStyle: TextStyle(
            // fontSize: 13.sp,
            ),
        indicatorColor: AppColors.main,
        indicator: UnderlineTabIndicator(
          insets: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
            bottom: -9.w,
          ),
          borderSide: BorderSide(
            color: AppColors.main,
            width: 3.w,
          ),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 1,
        // 坑爹玩意，只有设置了这个才会包裹内容显示tab
        isScrollable: true,
        labelPadding: EdgeInsets.only(left: 15.w, right: 15.w),
        tabs: titles.map((e) => Text(e)).toList(),
      ),
    );
  }
}
