import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/dss_library/widgets/app_bar_widget.dart';
import 'package:youliao/dss_library/widgets/basis/button_widget.dart';
import 'package:youliao/res/app_colors.dart';

class TestJsonPage extends StatelessWidget {
  const TestJsonPage({super.key});

  final String _json = '[{"name":"Jack"},{"name":"Rose"}]';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'json 测试'),
      body: Center(
        child: Column(
          children: [
            ButtonWidget(
              text: '测试',
              textColor: AppColors.mainText,
              fontSize: 20.sp,
              onPressed: () {
                List data = json.decode(_json);
                String name = data[0]['name'];
                log('name:$name');
              },
            )
          ],
        ),
      ),
    );
  }
}
