import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PredictIndexPage extends StatefulWidget {
  const PredictIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _PredictIndexPageState();
}

class _PredictIndexPageState extends State<PredictIndexPage>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;// 是否需要缓存

  @override
  Widget build(BuildContext context) {
    print("build - PredictIndexPage");
    super.build(context);// 缓存必须调用
    return const Center(
      child: Text("预测"),
    );
  }
}
