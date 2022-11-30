import 'package:dss_base_flutter/model/function_ext.dart';
import 'package:dss_base_flutter/net/base_entity.dart';
import 'package:dss_base_flutter/net/http_util.dart';
import 'package:dss_base_flutter/widgets/base/state_holder.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseViewModel {
  ValueNotifier<LoadingDialogState> state =
      ValueNotifier(LoadingDialogState.init);

  /// 加载对话框 - 显示
  void showLoadingDialog() {
    state.value = LoadingDialogState.show;
  }

  /// 加载对话框 - 隐藏
  void hideLoadingDialog() {
    state.value = LoadingDialogState.hide;
  }

  /// 省事的加载逻辑
  void launch<T>({
    bool isShowLoadingDialog = true,
    required Future<BaseEntity> future,
    InputDynamicReturnValueFunction<T>? convert,
    required NetSuccessCallbackT<T> onSuccess,
    required NetFailureCallback onFailure,
    Function? onComplete,
  }) {
    if (isShowLoadingDialog) {
      showLoadingDialog();
    }
    HttpUtil.instance
        .simpleCallback(
      future: future,
      convert: convert,
      onSuccess: onSuccess,
      onFailure: onFailure,
    )
        .whenComplete(() {
      if (isShowLoadingDialog) {
        hideLoadingDialog();
      }
      onComplete?.call();
    });
  }
}
