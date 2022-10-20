import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/widgets/RoundContainer.dart';
import 'package:youliao/widgets/RoundText.dart';
import 'package:youliao/widgets/load_image.dart';

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
              child: LoadAssetImage(
                'main/ic_tab_expert_selected',
                fit: BoxFit.contain,
              ),
            ),
            RoundText(
              text: 'text',
              textColor: Colors.blue,
              fontSize: 20,
              width: 200,
              height: 100,
              backgroundColor: Colors.red,
            )
          ],
        ),
      ],
    );
  }
}
