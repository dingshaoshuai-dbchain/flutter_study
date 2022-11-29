import 'package:flutter/cupertino.dart';
import 'package:youliao/dss_library/net/base_entity.dart';
import 'package:youliao/dss_library/widgets/base/state_holder.dart';

import '../../net/http_util.dart';

typedef BackValueFunction<T> = T Function(dynamic data);

abstract class BaseViewModel {
  ValueNotifier<LoadingDialogState> state =
      ValueNotifier(LoadingDialogState.init);

  void showLoadingDialog() {
    state.value = LoadingDialogState.show;
  }

  void hideLoadingDialog() {
    state.value = LoadingDialogState.hide;
  }

  void launch<T>({
    bool isShowLoadingDialog = true,
    required Future<BaseEntity> future,
    BackValueFunction<T>? convert,
    required NetSuccessCallbackT onSuccess,
    required NetFailureCallback onFailure,
  }) {
    if (isShowLoadingDialog) {
      showLoadingDialog();
    }
    future.then((value) {
      if (value.code == Code.success.code) {
        if (convert == null) {
          onSuccess(value.data);
        } else {
          T data = convert(value.data);
          onSuccess(data);
        }
      } else {
        onFailure(value.code, value.msg ?? Code.failure.msg);
      }
    }).whenComplete(() {
      if (isShowLoadingDialog) {
        hideLoadingDialog();
      }
    });
  }
}
