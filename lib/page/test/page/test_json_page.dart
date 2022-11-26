import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/dss_library/util/log_utils.dart';
import 'package:youliao/dss_library/widgets/app_bar_widget.dart';
import 'package:youliao/dss_library/widgets/basis/button_widget.dart';
import 'package:youliao/models/index.dart';
import 'package:youliao/res/app_colors.dart';

class TestJsonPage extends StatelessWidget {
  const TestJsonPage({super.key});

  final String _studentJson = '{"userId":1001,"name":"学生1","age":10,"sex":1}';

  final String _schoolJson =
      '{"name":"清华大学","nick_name":"冒牌的清华大学","students":[{"userId":1001,"name":"学生1","age":10,"sex":1},{"userId":1002,"name":"学生2","age":12,"sex":0}]}';

  final String _studentListJson =
      '[{"userId":1001,"name":"学生1","age":10,"sex":1},{"userId":1001,"name":"学生1","age":10,"sex":1}]';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'json 测试'),
      body: ListView(
        children: [
          ButtonWidget(
            text: '测试',
            textColor: AppColors.mainText,
            fontSize: 18.sp,
            backgroundColor: Colors.orange,
            onPressed: () {
              Map<String, dynamic> studentMap = json.decode(_studentJson);
              Student student = Student.fromJson(studentMap);
              Log.d('student.name = ${student.name}');

              Map<String, dynamic> schoolMap = json.decode(_schoolJson);
              School school = School.fromJson(schoolMap);
              Log.d(
                  'school.name = ${school.name}, school.nickname = ${school.nickName}');
              Log.d(
                  'school.first.student.name = ${school.students?.first.name}');

              Map<String, dynamic> studentMap2 = student.toJson();
              String studentJson = json.encode(studentMap2);
              Map<String, dynamic> schoolMap2 = school.toJson();
              String schoolJson = json.encode(schoolMap2);
              Log.d("studentMap2 = ${studentMap2.toString()}");
              Log.d("studentJson = $studentJson");
              Log.d("schoolJson = $schoolJson");

              List<dynamic> studentList= json.decode(_studentListJson);
              Log.d("studentList = $studentList");
            },
          )
        ],
      ),
    );
  }
}
