import 'package:flutter/material.dart';
import 'package:youliao/dss_library/widgets/base/base_state.dart';
import 'package:youliao/dss_library/widgets/base/state_holder.dart';

import 'base_page_view_model.dart';

mixin BasePageState<T extends StatefulWidget, VM extends BasePageViewModel>
    on BaseState<T, VM> {

  /// 单独的页面，往往需要标题区域
  PreferredSizeWidget? onCreateAppbar() => null;

  /// 页面状态 - 初始化
  Widget onCreateInitPage() => PageStateHolder.instance.initStatePage;

  /// 页面状态 - 加载中
  Widget onCreateLoadingPage() => PageStateHolder.instance.loadingStatePage;

  /// 页面状态 - 加载完成后的内容
  Widget onCreateContentPage();

  /// 页面状态 - 加载失败
  Widget onCreateFailurePage() => PageStateHolder.instance.failureStatePage;

  /// 页面状态 - 空数据
  Widget onCreateEmptyPage() => PageStateHolder.instance.emptyStatePage;

  /// 初始化一些监听
  void onInitListeners();

  @override
  void initState() {
    super.initState();
    viewModel.pageState.addListener(() {
      setState(() {});
    });
    onInitListeners();
    viewModel.initData();
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget? appbarWidget = onCreateAppbar();
    Widget body = getWidgetByState(viewModel.pageState.value);
    if (appbarWidget == null) {
      return body;
    }
    return Scaffold(
      appBar: appbarWidget,
      body: body,
    );
  }

  /// 根据状态来显示当前的 Widget
  Widget getWidgetByState(PageState state) {
    Widget page;
    switch (state) {
      case PageState.initState:
        page = onCreateInitPage();
        break;
      case PageState.loadingState:
        page = onCreateLoadingPage();
        break;
      case PageState.contentState:
        page = onCreateContentPage();
        break;
      case PageState.failureState:
        page = onCreateFailurePage();
        break;
      case PageState.emptyState:
        page = onCreateEmptyPage();
        break;
    }
    return page;
  }
}
