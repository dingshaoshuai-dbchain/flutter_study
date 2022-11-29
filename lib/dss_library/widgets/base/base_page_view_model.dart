import 'package:flutter/cupertino.dart';
import 'package:youliao/dss_library/widgets/base/base_view_model.dart';
import 'package:youliao/dss_library/widgets/base/state_holder.dart';

import '../../net/base_entity.dart';

/// 一般用作一进来就需要请求网络的界面，如：文章详情、消息列表..
abstract class BasePageViewModel<T> extends BaseViewModel {
  ValueNotifier<PageState> pageState = ValueNotifier(PageState.initState);
  dynamic params = {};

  /// 显示状态页 - 加载中
  void showLoadingPage() {
    pageState.value = PageState.loadingState;
  }

  /// 显示状态页 - 最终内容
  void showContentPage() {
    pageState.value = PageState.contentState;
  }

  /// 显示状态页 - 失败
  void showFailurePage() {
    pageState.value = PageState.failureState;
  }

  /// 显示状态页 - 空页面
  void showEmptyPage() {
    pageState.value = PageState.emptyState;
  }

  /// 请求数据往往需要参数
  void onInitParams(dynamic params) {
    this.params = params;
  }

  /// 一进来就需要初始化的数据，一般为网络请求
  void onInitData();

  /// 初始化完成的回调
  void onInitDataSuccess(T data);

  /// 省事的附带界面切换的加载逻辑
  void launchForPageState({
    required Future<BaseEntity> future,
    ValueFunction? convert,
    ValueFunction2<bool, T>? showEmpty,
  }) {
    showLoadingPage();
    launch(
      isShowLoadingDialog: false,
      future: future,
      convert: convert,
      onSuccess: (data) {
        if (showEmpty != null && showEmpty(data)) {
          showEmptyPage();
        } else {
          onInitDataSuccess(data);
          showContentPage();
        }
      },
      onFailure: (code, msg) {
        showFailurePage();
      },
    );
  }
}
