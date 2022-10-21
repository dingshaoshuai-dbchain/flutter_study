import 'package:flutter/cupertino.dart';
import 'package:youliao/util/status_bar_util.dart';

class StatusBar extends StatelessWidget implements PreferredSizeWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: StatusBarUtil.getStatusBarHeight(),
    );
  }

  @override
  Size get preferredSize =>
      Size(double.maxFinite, StatusBarUtil.getStatusBarHeight());
}
