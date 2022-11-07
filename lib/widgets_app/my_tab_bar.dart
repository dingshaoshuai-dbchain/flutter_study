import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/widgets/basis/container_widget.dart';

import '../res_app/app_colors.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    super.key,
    required this.pageController,
    required this.titles,
  });

  final TabController pageController;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      width: double.infinity,
      backgroundColor: Colors.white,
      radiusTopRight: 8.w,
      radiusTopLeft: 8.w,
      child: TabBar(
          padding:
              EdgeInsets.only(top: 13.w, bottom: 13.w, left: 10.w, right: 10.w),
          controller: pageController,
          labelColor: AppColors.color_181818,
          labelStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelColor: AppColors.color_181818,
          unselectedLabelStyle: TextStyle(
            fontSize: 13.sp,
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
          tabs: titles.map((e) => Text(e)).toList()),
    );
  }
}
