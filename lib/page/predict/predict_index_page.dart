import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/widgets/app_bar_common.dart';
import 'package:youliao/widgets/basis/container_widget.dart';

import '../../res_app/app_colors.dart';
import '../../widgets/basis/image_widget.dart';
import '../../widgets_app/my_tab_bar.dart';
import '../../widgets_app/plan_item_list.dart';

class PredictIndexPage extends StatefulWidget {
  const PredictIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _PredictIndexPageState();
}

class _PredictIndexPageState extends State<PredictIndexPage>
    with TickerProviderStateMixin {
  /// 方案控页制器等
  final List<String> _planTitles = [];
  final List<Widget> _planPages = [];
  late final TabController _planPageController;

  /// 专家页控制器等
  final List<String> _expertTitles = [];
  final List<Widget> _expertPages = [];
  late final TabController _expertPageController;

  @override
  void initState() {
    super.initState();
    _planTitles.clear();
    _planPages.clear();
    _planTitles.add('准确率排序');
    _planPages.add(const KeepAliveWrapper(child: PlanItemListWidget()));
    _planTitles.add('按人气');
    _planPages.add(const KeepAliveWrapper(child: PlanItemListWidget()));
    _planTitles.add('按时间');
    _planPages.add(const KeepAliveWrapper(child: PlanItemListWidget()));
    _planPageController = TabController(length: _planPages.length, vsync: this);

    _expertTitles.clear();
    _planPages.clear();
    _expertTitles.add('足球专家');
    _planPages.add(KeepAliveWrapper(child: _Expert()));
    _expertTitles.add('篮球专家');
    _planPages.add(KeepAliveWrapper(child: _Expert()));
  }

  @override
  Widget build(BuildContext context) {
    print("build - PredictIndexPage");
    return Scaffold(
      appBar: AppBarCommon(
        title: '预测',
        isShowBack: false,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            // Banner
            SliverPadding(
              padding: EdgeInsets.only(left: 9.w, right: 9.w, top: 8.w),
              sliver: SliverToBoxAdapter(
                child: _Banner(),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       MyTabBar(
            //         pageController: _expertPageController,
            //         titles: _expertTitles,
            //         radiusTopLeft: 0,
            //         radiusTopRight: 0,
            //       ),
            //       TabBarView(
            //         controller: _expertPageController,
            //         children: _expertPages,
            //       )
            //     ],
            //   ),
            // ),
            SliverPersistentHeaderToBox(
              child: MyTabBar(
                pageController: _planPageController,
                titles: _planTitles,
                radiusTopLeft: 0,
                radiusTopRight: 0,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _planPageController,
          children: _planPages,
        ),
      ),
    );
  }
}

/// Banner
class _Banner extends StatelessWidget {
  final _bannerList = [
    'https://live-yq.oss-cn-shenzhen.aliyuncs.com/cos/20221017213350486054/a8e11b6d-4b58-4fc0-9ae0-28e9f6958ae2.png?version=3',
    'https://live-yq.oss-cn-shenzhen.aliyuncs.com/cos/20221017200019301079/389f57a9-fe97-4d6a-92c9-22f282cdeb60.png?version=3',
    'https://live-yq.oss-cn-shenzhen.aliyuncs.com/cos/20221018173031992022/719753a7-4672-4b79-9610-2e2d9b83a566.png?version=3',
  ].map((e) => ImageWidget(
        url: e,
        fit: BoxFit.cover,
        imageRadius: 6.w,
        placeholder: 'app/ic_place_holder',
      ));

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      // 比例
      aspectRatio: 3.3 / 1,
      child: Swiper(
        // 指示器样式
        indicator: CircleSwiperIndicator(
            spacing: 8.w,
            radius: 3.w,
            itemActiveColor: Colors.white,
            itemColor: AppColors.colorAAAAAA,
            padding: EdgeInsets.only(bottom: 10.w)),
        // 轮播图资源
        children: _bannerList.toList(),
      ),
    );
  }
}

/// 专家栏
class _Expert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      backgroundColor: Colors.red,
      height: 200,
    );
  }
}
