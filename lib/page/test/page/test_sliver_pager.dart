import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/dss_library/widgets/app_bar_common.dart';

import '../../../res/app_colors.dart';
import '../../../dss_library/widgets/basis/container_widget.dart';
import '../../../dss_library/widgets/basis/text_widget.dart';

class TestSliverPage extends StatelessWidget {
  const TestSliverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: 'Sliver 吸顶测试'),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: _buildListHor(),
            ),
          ),
          _buildSliverList1(),
          SliverToBoxAdapter(
            child: ContainerWidget(
              backgroundColor: Colors.yellow,
              height: 200,
            ),
          ),
          SliverPersistentHeader(
            pinned: false,
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
          _buildSliverList2(),
        ],
      ),
    );
  }

  Widget _buildSliverList1() {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (_, index) => index % 2 == 0
              ? ContainerWidget(
                  height: 30,
                  backgroundColor: Colors.black,
                )
              : ContainerWidget(
                  height: 60,
                  backgroundColor: Colors.white,
                ),
          childCount: 20),
    );
  }

  Widget _buildSliverList2() {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (_, index) => index % 2 == 0
              ? ContainerWidget(
                  height: 30,
                  backgroundColor: Colors.red,
                )
              : ContainerWidget(
                  height: 60,
                  backgroundColor: Colors.cyanAccent,
                ),
          childCount: 50),
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
