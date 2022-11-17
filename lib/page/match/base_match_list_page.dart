import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/dss_library/widgets/basis/container_widget.dart';

import '../../res/app_colors.dart';
import '../../dss_library/util/font_weiget_util.dart';

abstract class BaseMatchListPage extends StatefulWidget {
  const BaseMatchListPage({super.key});

  @override
  State<StatefulWidget> createState() => _BaseMatchListPageState();

  Widget createItemPage();
}

class _BaseMatchListPageState extends State<BaseMatchListPage>
    with TickerProviderStateMixin {
  final List<String> _titles = [];
  final List<Widget> _pages = [];
  late final TabController _pageController;

  @override
  void initState() {
    super.initState();
    _titles.clear();
    _pages.clear();
    _titles.add('全部');
    _pages.add(KeepAliveWrapper(child: widget.createItemPage()));
    _titles.add('进行中');
    _pages.add(KeepAliveWrapper(child: widget.createItemPage()));
    _titles.add('赛程');
    _pages.add(KeepAliveWrapper(child: widget.createItemPage()));
    _titles.add('赛果');
    _pages.add(KeepAliveWrapper(child: widget.createItemPage()));
    _titles.add('关注');
    _pages.add(KeepAliveWrapper(child: widget.createItemPage()));
    _pageController = TabController(length: _pages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TabBar(pageController: _pageController, titles: _titles),
        Expanded(
          child: TabBarView(
            controller: _pageController,
            children: _pages,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({
    required this.pageController,
    required this.titles,
  });

  final TabController pageController;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      backgroundColor: Colors.white,
      height: 38.w,
      paddingTop: 3.w,
      paddingBottom: 5.w,
      child: TabBar(
        controller: pageController,
        labelColor: AppColors.mainText,
        labelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeightUtil.pingFangSCSemibold,
        ),
        unselectedLabelColor: AppColors.summaryText2,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.sp,
        ),
        indicatorColor: AppColors.main,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding:
            EdgeInsets.only(left: 5.w, right: 5.w, top: 5.w, bottom: 0.w),
        // 是否滚动显示
        isScrollable: false,
        tabs: titles.map((e) => Text(e)).toList(),
      ),
    );
  }
}
