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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBarCommon(title: 'NestedScrollView 测试'),
  //     body: NestedScrollView(
  //       key: GlobalKey(),
  //       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
  //         return [
  //           SliverToBoxAdapter(
  //             child: SizedBox(
  //               height: 200,
  //               child: _buildListHor(),
  //             ),
  //           ),
  //           SliverPersistentHeader(
  //             pinned: true,
  //             floating: true,
  //             delegate: SliverHeaderDelegate(
  //               maxHeight: 50.w,
  //               minHeight: 50.w,
  //               child: TextWidget(
  //                 text: '我可以固定',
  //                 textColor: AppColors.color_181818,
  //                 fontSize: 20.sp,
  //                 height: 50.w,
  //                 backgroundColor: Colors.orange,
  //               ),
  //             ),
  //           ),
  //         ];
  //       },
  //       body: _buildList(),
  //     ),
  //   );
  // }
  //
  // Widget _buildList() {
  //   return ListView.builder(
  //     itemCount: 50,
  //     physics: BouncingScrollPhysics(),
  //     itemBuilder: (_, index) {
  //       return index % 2 == 0
  //           ? ContainerWidget(
  //               height: 30,
  //               backgroundColor: Colors.red,
  //             )
  //           : ContainerWidget(
  //               height: 60,
  //               backgroundColor: Colors.cyanAccent,
  //             );
  //     },
  //   );
  // }
  //
  // Widget _buildListHor() {
  //   return ListView.builder(
  //     itemCount: 50,
  //     scrollDirection: Axis.horizontal,
  //     itemBuilder: (_, index) {
  //       return index % 2 == 0
  //           ? ContainerWidget(
  //         width: 30,
  //         height: 20,
  //         backgroundColor: Colors.red,
  //       )
  //           : ContainerWidget(
  //         width: 60,
  //         height: 20,
  //         backgroundColor: Colors.cyanAccent,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final _tabs = <String>['猜你喜欢', '今日特价', '发现更多'];
    // 构建 tabBar
    return DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: ContainerWidget(
                  backgroundColor: Colors.red,
                  height: 100,
                ),
              ),
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text('商城'),
                  floating: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: _tabs.map((String name) {
              return Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(8.0),
                        sliver: _buildSliverList1(),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
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
          childCount: 50),
    );
  }
}
