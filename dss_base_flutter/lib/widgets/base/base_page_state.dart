import 'package:dss_base_flutter/widgets/base/base_page_view_model.dart';
import 'package:dss_base_flutter/widgets/base/base_state.dart';
import 'package:dss_base_flutter/widgets/base/state_holder.dart';
import 'package:flutter/material.dart';


abstract class BasePageState<T extends StatefulWidget,
    VM extends BasePageViewModel> extends BaseState<T, VM> {
  /// 单独的页面，往往需要标题区域
  PreferredSizeWidget? onCreateAppbar(BuildContext context) => null;

  /// 页面状态 - 初始化
  Widget onCreateInitPage(BuildContext context) =>
      PageStateHolder.instance.initStatePage;

  /// 页面状态 - 加载中
  Widget onCreateLoadingPage(BuildContext context) =>
      PageStateHolder.instance.loadingStatePage;

  /// 页面状态 - 加载完成后的内容
  Widget onCreateContentPage(BuildContext context);

  /// 页面状态 - 加载失败
  Widget onCreateFailurePage(BuildContext context) =>
      PageStateHolder.instance.failureStatePage;

  /// 页面状态 - 空数据
  Widget onCreateEmptyPage(BuildContext context) =>
      PageStateHolder.instance.emptyStatePage;

  /// 初始化一些监听
  void onInitListeners() {}

  /// 初始化数据需要的参数
  dynamic onInitParams() => {};

  @override
  void initState() {
    super.initState();
    viewModel.pageState.addListener(() {
      setState(() {});
    });
    onInitListeners();
    viewModel.onInitParams(onInitParams());
    viewModel.onInitData();
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget? appbarWidget = onCreateAppbar(context);
    Widget body = getWidgetByState(context, viewModel.pageState.value);
    if (appbarWidget == null) {
      return body;
    }
    return Scaffold(
      appBar: appbarWidget,
      body: body,
    );
  }

  /// 根据状态来显示当前的 Widget
  Widget getWidgetByState(BuildContext context, PageState state) {
    Widget page;
    switch (state) {
      case PageState.initState:
        page = onCreateInitPage(context);
        break;
      case PageState.loadingState:
        page = onCreateLoadingPage(context);
        break;
      case PageState.contentState:
        page = onCreateContentPage(context);
        break;
      case PageState.failureState:
        page = onCreateFailurePage(context);
        break;
      case PageState.emptyState:
        page = onCreateEmptyPage(context);
        break;
    }
    return page;
  }
}
