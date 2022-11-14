import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/dss_library/widgets/app_bar_widget.dart';
import 'package:youliao/dss_library/widgets/basis/container_widget.dart';
import 'package:youliao/dss_library/widgets/gaps.dart';

import '../../dss_library/util/toast_util.dart';
import '../../res/app_colors.dart';
import '../../dss_library/util/font_weiget_util.dart';
import '../../dss_library/widgets/basis/image_widget.dart';
import '../../widgets/my_tab_bar.dart';
import '../../widgets/plan_item_list.dart';

class PredictIndexPage extends StatefulWidget {
  const PredictIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _PredictIndexPageState();
}

class _PredictIndexPageState extends State<PredictIndexPage>
    with TickerProviderStateMixin {
  /// 专家页控制器等
  final List<String> _expertTitles = [];
  final List<Widget> _expertPages = [];
  late final TabController _expertPageController;

  /// 方案控页制器等
  final List<String> _planTitles = [];
  final List<Widget> _planPages = [];
  late final TabController _planPageController;

  @override
  void initState() {
    super.initState();
    _expertTitles.clear();
    _expertPages.clear();
    _expertTitles.add('足球专家');
    _expertPages.add(KeepAliveWrapper(child: _ExpertWidget()));
    _expertTitles.add('篮球专家');
    _expertPages.add(KeepAliveWrapper(child: _ExpertWidget()));
    _expertPageController =
        TabController(length: _expertPages.length, vsync: this);

    _planTitles.clear();
    _planPages.clear();
    _planTitles.add('准确率排序');
    _planPages.add(const KeepAliveWrapper(child: PlanItemListWidget()));
    _planTitles.add('按人气');
    _planPages.add(const KeepAliveWrapper(child: PlanItemListWidget()));
    _planTitles.add('按时间');
    _planPages.add(const KeepAliveWrapper(child: PlanItemListWidget()));
    _planPageController = TabController(length: _planPages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    print("build - PredictIndexPage");
    return Scaffold(
      appBar: AppBarWidget(
        title: '预测',
        isShowBack: false,
        leftMenuWidget: [
          ImageWidget(
            url: 'app/ic_search',
            width: 40.w,
            height: 40.w,
            padding: 11.5.w,
            marginLeft: 5.w,
            onPressed: () {
              Toast.show('搜索');
            },
          ),
        ],
        rightMenuWidget: [
          ImageWidget(
            url: 'app/ic_my_predict',
            width: 40.w,
            height: 40.w,
            padding: 11.w,
            marginRight: 5.w,
            onPressed: () {
              Toast.show('我的预测');
            },
          ),
        ],
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
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gaps.vGap8,
                  MyTabBar(
                    pageController: _expertPageController,
                    titles: _expertTitles,
                  ),
                  SizedBox(
                    height: 200.w,
                    child: TabBarView(
                      controller: _expertPageController,
                      children: _expertPages,
                    ),
                  )
                ],
              ),
            ),
            SliverPersistentHeaderToBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gaps.vGap1,
                  MyTabBar(
                    pageController: _planPageController,
                    titles: _planTitles,
                    radiusTopLeft: 0.w,
                    radiusTopRight: 0.w,
                  )
                ],
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
class _ExpertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      backgroundColor: Colors.white,
      paddingHorizontal: 5.w,
      child: GridView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            // 宽高比（宽/高）
            childAspectRatio: 0.75,
            mainAxisSpacing: 0),
        itemBuilder: (context, index) {
          return index == 10 - 1
              ? _buildLastItem(context)
              : _buildItem(context, index);
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return ContainerWidget(
      onPressed: () {
        Toast.show('跳转专家主页');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageWidget(
            url: 'app/ic_default_avatar',
            width: 40.w,
            height: 40.w,
            imageRadius: 20.w,
          ),
          Gaps.vGap6,
          Text(
            '哥是个传说',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: AppColors.color_181818,
                fontSize: 12.sp,
                fontWeight: FontWeightUtil.pingFangSCSemibold),
          ),
          Gaps.vGap1,
          Text(
            '平台人气王',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.color_999999,
              fontSize: 8.sp,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLastItem(BuildContext context) {
    return ContainerWidget(
        onPressed: () {
          Toast.show('跳转更多专家');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(
              url: 'expert/ic_more_expert',
              width: 40.w,
              height: 40.w,
              imageRadius: 20.w,
            ),
            Gaps.vGap6,
            Text(
              '更多专家',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.main,
                  fontSize: 12.sp,
                  fontWeight: FontWeightUtil.pingFangSCSemibold),
            ),
            Gaps.vGap1,
            Text(
              '占位',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8.sp,
              ),
            )
          ],
        ));
  }
}
