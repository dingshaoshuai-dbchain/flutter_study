import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpertIndexPage extends StatefulWidget {
  const ExpertIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _ExpertIndexPageState();
}

class _ExpertIndexPageState extends State<ExpertIndexPage>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;// 是否需要缓存

  @override
  Widget build(BuildContext context) {
    print("build - ExpertIndexPage");
    return const Center(
      child: Text("专家"),
    );
  }
}
