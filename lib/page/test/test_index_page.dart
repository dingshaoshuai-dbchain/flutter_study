import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/dss_library/util/navigator_util.dart';
import 'package:youliao/dss_library/widgets/app_bar_widget.dart';
import 'package:youliao/dss_library/widgets/basis/text_widget.dart';
import 'package:youliao/page/test/test_router.dart';
import 'package:youliao/res/app_colors.dart';

class TestIndexPage extends StatelessWidget {
  const TestIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: '测试组件', isShowBack: false),
      body: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        children: [
          _buildPageButton(context, 'sliver 吸顶', () {
            NavigatorUtil.push(context, TestRouter.testSliverPager);
          }),
          _buildPageButton(context, 'NestedScrollerView 吸顶', () {
            NavigatorUtil.push(context, TestRouter.testNestedScrollerPager);
          }),
          Center(
            child: TextWidget(
              text: 't',
              textColor: AppColors.mainText,
              fontSize: 18.sp,
              backgroundColor: Colors.red,
              minWidth: 100,
              maxWidth: 300,
              height: 50,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPageButton(
    BuildContext context,
    String title,
    VoidCallback? onPressed,
  ) {
    return ElevatedButton(onPressed: onPressed, child: Text(title));
  }
}
