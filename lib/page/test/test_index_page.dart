import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/api/expert_api.dart';
import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:youliao/global/match_mode.dart';
import 'package:youliao/page/test/test_router.dart';

class TestIndexPage extends StatefulWidget {
  const TestIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _TestIndexPageState();
}

class _TestIndexPageState extends BaseState<TestIndexPage, _TestIndexPageViewModel>{
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
            // CommonApi.instance.getBanner(
            //   locationId: 2,
            //   onSuccess: (value) {
            //     Log.d('请求成功123：${value[0].imageUrl}');
            //   },
            //   onFailure: (code, msg) {
            //     Log.d('请求失败：$msg');
            //   },
            // );
            // PlanApi.instance
            //     .getPlanList(onSuccess: (_) {}, onFailure: (_, __) {});
            viewModel.test();
          }),
          _buildPageButton(context, '下拉刷新 测试', () {
            NavigatorUtil.push(context, TestRouter.testListRefresh);
          }),
          _buildPageButton(context, '下拉刷新2 测试', () {
            NavigatorUtil.push(context, TestRouter.testListRefresh2);
          }),
        ],
      ),
    );
  }

  Widget _buildPageButton(BuildContext context,
      String title,
      VoidCallback? onPressed,) {
    return ElevatedButton(onPressed: onPressed, child: Text(title));
  }

  @override
  _TestIndexPageViewModel onCreateViewModel() => _TestIndexPageViewModel();
}

class _TestIndexPageViewModel extends BaseViewModel {

  void test() {
    launch(
        future: ExpertApi.instance.getExpertList(matchMode: MatchMode.all),
        onSuccess: (data) {
          Toast.show('成功了');
        },
        onFailure: (code, msg) {
          Toast.show(msg);
        });
  }
}
