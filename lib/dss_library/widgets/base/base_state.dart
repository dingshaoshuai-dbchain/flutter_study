import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/dss_library/widgets/base/base_view_model.dart';
import 'package:youliao/dss_library/widgets/base/state_holder.dart';

/// 一般用作操作之后需要请求网络等操作的界面，如：登录、设置..
abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> {
  late VM viewModel;

  /// 创建 ViewModel
  VM onCreateViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = onCreateViewModel();
    viewModel.state.addListener(() {
      switch (viewModel.state.value) {
        case LoadingDialogState.init:
          break;
        case LoadingDialogState.show:
          showLoadingDialog(context);
          break;
        case LoadingDialogState.hide:
          hideLoadingDialog(context);
          break;
      }
    });
  }

  /// 对话框 - 显示
  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return loadingDialog;
      },
    );
  }

  /// 对话框 - 隐藏
  void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
