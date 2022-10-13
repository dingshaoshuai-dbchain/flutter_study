import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/routers/expert/page/expert_index_page.dart';
import 'package:youliao/routers/home/page/home_index_page.dart';
import 'package:youliao/routers/match/page/match_index_page.dart';
import 'package:youliao/routers/my/page/my_index_page.dart';
import 'package:youliao/routers/predict/page/predict_index_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var pages = [
    const KeepAliveWrapper(child: HomeIndexPage()),
    const KeepAliveWrapper(child: ExpertIndexPage()),
    const KeepAliveWrapper(child: PredictIndexPage()),
    const KeepAliveWrapper(child: MatchIndexPage()),
    const KeepAliveWrapper(child: MyIndexPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: pages,
    );
  }
}
