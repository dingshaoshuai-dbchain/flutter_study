import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/dss_library/widgets/base/base_view_model.dart';
import 'package:youliao/dss_library/widgets/base/state_holder.dart';

mixin BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    on State<T> {
  late VM viewModel;

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

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return loadingDialog;
      },
    );
  }

  void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
