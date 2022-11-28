import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/dss_library/widgets/base/base_view_model.dart';
import 'package:youliao/dss_library/widgets/base/contract.dart';
import 'package:youliao/dss_library/widgets/base/page_state.dart';

mixin BasePageState<T extends StatefulWidget, VM extends BaseViewModel>
    on State<T> implements Contract {
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

  @override
  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return loadingDialog;
      },
    );
  }

  @override
  void hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
