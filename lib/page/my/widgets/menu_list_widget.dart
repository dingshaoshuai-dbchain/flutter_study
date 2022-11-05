import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/page/my/widgets/menu_item_widget.dart';
import 'package:youliao/util/log_utils.dart';
import 'package:youliao/util/toast_util.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/gaps.dart';

class MenuListWidget extends StatelessWidget {
  const MenuListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Log.d('build - MenuListWidget');
    return ContainerWidget(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          MenuItemWidget(
            url: 'my/ic_feedback',
            text: '意见反馈',
            onPressed: (){
              Toast.show('意见反馈');
            },
          ),
          Gaps.hLine(indent: 48.w, endIndent: 38.w),
          MenuItemWidget(
            url: 'my/ic_person',
            text: '申请成为专家',
            onPressed: (){
              Toast.show('申请成为专家');
            },
          ),
          Gaps.hLine(indent: 48.w, endIndent: 38.w),
          MenuItemWidget(
            url: 'my/ic_settings',
            text: '设置',
            onPressed: (){
              Toast.show('设置');
            },
          ),
        ],
      ),
    );
  }
}
