import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/widgets/basis/round_image.dart';

class ExpertIndexPage extends StatefulWidget {
  const ExpertIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _ExpertIndexPageState();
}

class _ExpertIndexPageState extends State<ExpertIndexPage> {

  @override
  Widget build(BuildContext context) {
    print("build - ExpertIndexPage");
    return Center(
      child: RoundImage(
        url: 'https://t7.baidu.com/it/u=4272803060,4157549139&fm=193&f=GIF',
        width: 200,
        height: 200,
        fit: BoxFit.cover,
        radius: 30,
        backgroundColor: Colors.blue,
        padding: 30,
        imageRadius: 100,
        placeholder: 'app/ic_gold',
      ),
    );
  }
}
