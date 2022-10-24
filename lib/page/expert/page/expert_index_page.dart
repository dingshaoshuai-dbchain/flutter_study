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
        url: 'app/ic_default_avatar',
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
