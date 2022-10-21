import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/widgets/basis/round_container.dart';
import 'package:youliao/widgets/basis/round_image.dart';

import '../../../widgets/basis/round_text.dart';

class HomeIndexPage extends StatefulWidget {
  const HomeIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {
  @override
  Widget build(BuildContext context) {
    print("build - HomeIndexPage");
    return ListView(
      children: [
        Row(
          children: [
            RoundContainer(
              width: 100,
              height: 100,
              backgroundColor: Colors.yellow,
              child: RoundImage(
                url:'main/ic_tab_expert_selected',
                fit: BoxFit.contain,
              ),
            ),
            RoundText(
              text: 'text',
              textColor: Colors.blue,
              fontSize: 20,
              width: 200,
              height: 100,
              marginLeft: 10,
              radius: 20,
              backgroundColor: Colors.red,
            )
          ],
        ),
      ],
    );
  }
}
