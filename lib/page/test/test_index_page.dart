import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/page/test/page/test_router_pager.dart';
import 'package:youliao/util/navigator_util.dart';
import 'package:youliao/widgets/app_bar_common.dart';

class TestIndexPage extends StatelessWidget {
  const TestIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: '测试组件', isShowBack: false),
      body: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        children: [
          _buildPageButton(context, 'sliver 吸顶', () {
            NavigatorUtil.push(context, TestRouter.testSliverPager);
          }),
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
