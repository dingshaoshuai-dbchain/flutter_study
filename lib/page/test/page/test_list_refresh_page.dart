import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:youliao/widgets/plan_item_list.dart';

class TestListRefreshPage extends StatelessWidget {
  const TestListRefreshPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: '下拉刷新测试'),
      body: const PlanItemListWidget(),
    );
  }
}
