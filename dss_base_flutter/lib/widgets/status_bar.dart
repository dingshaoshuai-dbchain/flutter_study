import 'package:flutter/cupertino.dart';

import '../util/status_bar_util.dart';

class StatusBar extends StatelessWidget implements PreferredSizeWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: StatusBarUtil.getStatusBarHeight(),
    );
  }

  @override
  Size get preferredSize =>
      Size(double.maxFinite, StatusBarUtil.getStatusBarHeight());
}
