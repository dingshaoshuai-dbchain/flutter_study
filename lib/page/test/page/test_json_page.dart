import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/dss_library/util/toast_util.dart';
import 'package:youliao/dss_library/widgets/app_bar_widget.dart';
import 'package:youliao/dss_library/widgets/basis/button_widget.dart';
import 'package:youliao/dss_library/widgets/basis/text_widget.dart';
import 'package:youliao/res/app_colors.dart';

class TestJsonPage extends StatelessWidget {
  const TestJsonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'json 测试'),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
            child: Text(
              '测试',
              style: TextStyle(fontSize: 50.sp),
            ),
          ),
          TextWidget(
            text: '测试',
            textColor: AppColors.mainText,
            fontSize: 100.sp,
            backgroundColor: Colors.blue,
            onPressed: () {
              Toast.show('点击了测试');
            },
          ),
          ButtonWidget(
            text: '测试',
            textColor: AppColors.mainText,
            fontSize: 100.sp,
            backgroundColor: Colors.cyan,
            onPressed: () {
              Toast.show('点击了测试');
            },
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.orange
            ),
            child: TextButton(
              onPressed: () {
                Toast.show('点击了测试');
              },
              child: Text(
                '测试',
                style: TextStyle(
                  fontSize: 100.sp,
                  color: AppColors.mainText
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
