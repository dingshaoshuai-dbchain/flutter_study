import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/widgets/basis/text_widget.dart';

import '../../widgets/basis/container_widget.dart';

class PredictIndexPage extends StatefulWidget {
  const PredictIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _PredictIndexPageState();
}

class _PredictIndexPageState extends State<PredictIndexPage> {
  @override
  Widget build(BuildContext context) {
    print("build - PredictIndexPage");
    return ListView(
      children: [
        //比如这里还有很多视图
        //...
        //...
        TextWidget(
            text: '标题', textColor: AppColors.color_181818, fontSize: 20.sp),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (_, index) {
            return ContainerWidget(
              backgroundColor: index % 2 == 0 ? Colors.red : Colors.blue,
              height: 300,
            );
          },
        ),
      ],
    );
  }
}
