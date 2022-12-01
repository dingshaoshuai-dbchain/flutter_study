import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res/app_colors.dart';

class TestListRefresh2Page extends StatefulWidget {
  const TestListRefresh2Page({super.key});

  @override
  State<StatefulWidget> createState() => _TestListRefresh2PageState();
}

class _TestListRefresh2PageState extends State<TestListRefresh2Page> {
  List<String> _data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: '下拉刷新测试'),
      body: ContainerWidget(
        child: EasyRefresh(
          onRefresh: () async {
            Log.d('下拉刷新 - start');
            await Future.delayed(const Duration(seconds: 1));
            Log.d('下拉刷新 - end');
            _data.clear();
            for (int i = 0; i < 10; i++) {
              _data.add('${_data.length + 1}');
            }
            setState(() {});
          },
          onLoad: () async {
            Log.d('上拉加载 - start');
            await Future.delayed(const Duration(seconds: 1));
            Log.d('上拉加载 - end');
            for (int i = 0; i < 10; i++) {
              _data.add('${_data.length + 1}');
            }
            setState(() {});
          },
          child: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              return TextWidget(
                text: _data[index],
                textColor: AppColors.mainText,
                fontSize: 20.sp,
                backgroundColor:
                    index % 2 == 0 ? Colors.lightBlueAccent : Colors.blueGrey,
                height: 100.w,
              );
            },
          ),
        ),
      ),
    );
  }
}
