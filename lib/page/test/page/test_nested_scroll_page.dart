import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/widgets/app_bar_common.dart';
import 'package:youliao/widgets/basis/container_widget.dart';

import '../../../res_app/app_colors.dart';
import '../../../widgets/basis/text_widget.dart';

class TestNestedScrollPage extends StatelessWidget {
  const TestNestedScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: 'NestedScrollView 测试'),
      body: NestedScrollView(
        key: GlobalKey(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: _buildListHor(),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: SliverHeaderDelegate(
                maxHeight: 50.w,
                minHeight: 50.w,
                child: TextWidget(
                  text: '我可以固定',
                  textColor: AppColors.color_181818,
                  fontSize: 20.sp,
                  height: 50.w,
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
          ];
        },
        body: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (_, index) {
        return index % 2 == 0
            ? ContainerWidget(
                height: 30,
                backgroundColor: Colors.red,
              )
            : ContainerWidget(
                height: 60,
                backgroundColor: Colors.cyanAccent,
              );
      },
    );
  }

  Widget _buildListHor() {
    return ListView.builder(
      itemCount: 50,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return index % 2 == 0
            ? ContainerWidget(
          width: 30,
          height: 20,
          backgroundColor: Colors.red,
        )
            : ContainerWidget(
          width: 60,
          height: 20,
          backgroundColor: Colors.cyanAccent,
        );
      },
    );
  }
}
