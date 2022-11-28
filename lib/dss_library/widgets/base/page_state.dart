
import 'package:flutter/material.dart';

/// 页面状态
enum PageState {
  initState,
  loadingState,
  contentState,
  failureState,
  emptyState;
}

/// 对话框改变状态
enum LoadingDialogState{
  init,
  show,
  hide
}

/// 全局的 loading 对话框
Widget loadingDialog = const CircularProgressIndicator();



