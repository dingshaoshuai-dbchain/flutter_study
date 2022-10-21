import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youliao/main_provider.dart';
import 'package:youliao/routers/expert/page/expert_index_page.dart';
import 'package:youliao/routers/home/page/home_index_page.dart';
import 'package:youliao/routers/match/page/match_index_page.dart';
import 'package:youliao/routers/my/page/my_index_page.dart';
import 'package:youliao/routers/predict/page/predict_index_page.dart';
import 'package:youliao/widgets/basis/round_image.dart';
import 'package:youliao/widgets/double_tap_back_exit_app.dart';

import 'app_res/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with RestorationMixin {
  final _items = <BottomNavigationBarItem>[];
  final _pages = <Widget>[];
  final PageController _pageController = PageController();
  final MainProvider provider = MainProvider();

  @override
  void initState() {
    super.initState();
    _items.add(_getBottomNavigationBarItem(
      label: "首页",
      normalPath: 'main/ic_tab_home_normal',
      selectedPath: 'main/ic_tab_home_selected',
    ));
    _pages.add(const KeepAliveWrapper(child: HomeIndexPage()));

    _items.add(_getBottomNavigationBarItem(
      label: "专家",
      normalPath: 'main/ic_tab_expert_normal',
      selectedPath: 'main/ic_tab_expert_selected',
    ));
    _pages.add(const KeepAliveWrapper(child: ExpertIndexPage()));

    _items.add(_getBottomNavigationBarItem(
      label: "预测",
      normalPath: 'main/ic_tab_predict_normal',
      selectedPath: 'main/ic_tab_predict_selected',
    ));
    _pages.add(const KeepAliveWrapper(child: PredictIndexPage()));

    _items.add(_getBottomNavigationBarItem(
      label: "比分",
      normalPath: 'main/ic_tab_match_normal',
      selectedPath: 'main/ic_tab_match_selected',
    ));
    _pages.add(const KeepAliveWrapper(child: MatchIndexPage()));

    _items.add(_getBottomNavigationBarItem(
      label: "我的",
      normalPath: 'main/ic_tab_my_normal',
      selectedPath: 'main/ic_tab_my_selected',
    ));
    _pages.add(const KeepAliveWrapper(child: MyIndexPage()));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
        create: (_) => provider,
        child: DoubleTapBackExitApp(
            child: Scaffold(
              bottomNavigationBar: Consumer<MainProvider>(
                builder: (_, provider, __) {
                  return BottomNavigationBar(
                    backgroundColor: Colors.white,
                items: _items,
                currentIndex: provider.value,
                // flex:文字始终显示 shifting:选中的显示文字
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.main,
                unselectedItemColor: AppColors.color_666666,
                onTap: (index) => _pageController.jumpToPage(index),
              );
            },
          ),
          body: _getPageView(_pageController, provider, _pages),
        )));
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(
      {required String label,
      required String normalPath,
      required String selectedPath,
      double normalSize = 20.0,
      double selectedSize = 20.0}) {
    return BottomNavigationBarItem(
        icon: RoundImage(url: normalPath, width: normalSize),
        activeIcon: RoundImage(url: selectedPath, width: selectedSize),
        label: label);
  }

  Widget _getPageView(PageController controller, MainProvider provider,
      List<Widget> children) {
    return PageView(
      // 禁止滑动
      // physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      onPageChanged: (int index) => provider.value = index,
      children: children,
    );
  }

  @override
  String? get restorationId => "main";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(provider, 'BottomNavigationBarCurrentIndex');
  }
}
