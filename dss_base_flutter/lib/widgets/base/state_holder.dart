import 'package:dss_base_flutter/widgets/basis/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 对话框改变状态
enum LoadingDialogState { init, show, hide }

/// 全局的 loading 对话框
Widget loadingDialog = Center(
  child: ContainerWidget(
    width: 100.w,
    height: 100.w,
    radius: 10.w,
    padding: 25.w,
    backgroundColor: Colors.white,
    child: const CircularProgressIndicator(),
  ),
);

/// 页面状态
enum PageState {
  initState,
  loadingState,
  contentState,
  failureState,
  emptyState;
}

/// 页面状态视图
class PageStateHolder {
  PageStateHolder._();

  static final PageStateHolder _singleton = PageStateHolder._();

  factory PageStateHolder() => _singleton;

  static PageStateHolder get instance => _singleton;

  Widget initStatePage = const Center(
    child: CircularProgressIndicator(),
  );
  Widget loadingStatePage = const Center(
    child: CircularProgressIndicator(),
  );
  Widget failureStatePage = const Center(
    child: Text('网络开小差了，请检查网络设置'),
  );
  Widget emptyStatePage = const Center(
    child: Text('暂无数据'),
  );
}
