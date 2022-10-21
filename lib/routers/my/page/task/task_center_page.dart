import 'package:flutter/material.dart';
import 'package:youliao/app_res/app_colors.dart';
import 'package:youliao/widgets/basis/round_container.dart';
import 'package:youliao/widgets/basis/round_image.dart';
import 'package:youliao/widgets/image_back.dart';
import 'package:youliao/widgets/status_bar.dart';

import '../../../../widgets/basis/round_text.dart';

class TaskCenterPage extends StatefulWidget {
  const TaskCenterPage({super.key});

  @override
  State<StatefulWidget> createState() => _TaskCenterPageState();
}

class _TaskCenterPageState extends State<TaskCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RoundImage(url: 'my/task/bg_task_center'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StatusBar(),
              const ImageBack(isBlack: false),
              _buildUserInfo(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildUserInfo() {
  return RoundContainer(
    width: double.maxFinite,
    height: 52,
    marginLeft: 16,
    marginRight: 16,
    marginTop: 40,
    child: Row(
      children: [
        const RoundImage(url: 'main/ic_tab_my_normal'),
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: '已连续签到',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: ' 1 ',
                        style: TextStyle(
                          color: AppColors.main,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '天',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                RoundText(
                  alignment: Alignment.centerLeft,
                  text: '明日签到可获得10金币',
                  textColor: Color(0xFF7E8398),
                  fontSize: 12,
                  marginTop: 3,
                ),
              ],
            ),
          ),
        ),
        RoundContainer(
          width: 82,
          height: 41,
          borderSide: BorderSide(color: Color(0xFF7E8398), width: 1),
          radius: 12,
          child: Row(
            children: [
              RoundImage(
                url: 'app/ic_gold',
              )
            ],
          ),
        )
      ],
    ),
  );
}
