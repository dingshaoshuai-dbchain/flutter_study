import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/dss_library/widgets/app_bar_widget.dart';
import 'package:youliao/dss_library/widgets/basis/button_widget.dart';
import 'package:youliao/models/index.dart';
import 'package:youliao/res/app_colors.dart';

import '../../../models/student.dart';

class TestJsonPage extends StatelessWidget {
  const TestJsonPage({super.key});

  final String _json = '[{"name":"Jack"},{"name":"Rose"}]';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'json 测试'),
      body: ButtonWidget(
        text: '测试',
        textColor: AppColors.mainText,
        fontSize: 20.sp,
        onPressed: () {
          Map<String, dynamic> map = HashMap<String, dynamic>();
          map["userId"] = 123456;
          map["name"] = "张三";
          map["age"] = 18;
          map["sex"] = 1;
          Student student = Student.fromJson(map);
          log('student.name:${student.name}');

          String json = student.toJson().toString();
          log('json:$json');

          Map<String, dynamic> schoolMap = HashMap<String, dynamic>();
          schoolMap["name"] = "清华大学";
          schoolMap["students"] = [student, student, student];
          School school = School.fromJson(schoolMap);
          String schoolJson = school.toJson().toString();
          log('学校：$schoolJson');
        },
      ),
    );
  }
}
