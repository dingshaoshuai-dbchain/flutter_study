import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/basis/image_widget.dart';

import '../../widgets/basis/text_widget.dart';

class FindIndexPage extends StatefulWidget {
  const FindIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _FindIndexPageState();
}

class _FindIndexPageState extends State<FindIndexPage> {
  @override
  Widget build(BuildContext context) {
    print("build - HomeIndexPage");
    return ListView(
      children: [
        Row(
          children: [
            ContainerWidget(
              width: 100,
              height: 100,
              backgroundColor: Colors.yellow,
              child: ImageWidget(
                url:'main/ic_tab_expert_selected',
                fit: BoxFit.contain,
              ),
            ),
            TextWidget(
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
