import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/api/common_api.dart';
import 'package:youliao/dss_library/util/log_utils.dart';
import 'package:youliao/dss_library/util/navigator_util.dart';
import 'package:youliao/dss_library/widgets/app_bar_widget.dart';
import 'package:youliao/page/test/test_router.dart';

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
            NavigatorUtil.push(context, TestRouter.testSliverPage);
          }),
          _buildPageButton(context, 'NestedScrollerView 吸顶', () {
            NavigatorUtil.push(context, TestRouter.testNestedScrollerPage);
          }),
          _buildPageButton(context, 'json 测试', () {
            NavigatorUtil.push(context, TestRouter.testJsonPage);
          }),
          _buildPageButton(context, '异步 测试', () {
            NavigatorUtil.push(context, TestRouter.testFutureStream);
          }),
          _buildPageButton(context, '网络 测试', () {
            CommonApi.instance.getBanner(
              locationId: 2,
              onSuccess: (value) {
                Log.d('请求成功123：${value[0].imageUrl}');
              },
              onFailure: (code, msg) {
                Log.d('请求失败：$msg');
              },
            );
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
