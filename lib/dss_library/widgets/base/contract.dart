import 'package:flutter/cupertino.dart';

abstract class Contract {
  void showLoadingDialog(BuildContext context);

  void hideLoadingDialog(BuildContext context);
}
