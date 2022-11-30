import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:dss_base_flutter/dss_base_flutter.dart';

class TaskItemWidget extends StatefulWidget {
  const TaskItemWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      paddingTop: 14,
      paddingBottom: 14,
      child: Row(
        children: [
          ImageWidget(
            url: 'app/ic_gold',
            width: 30,
            height: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: '累计签到3天',
                  textColor: AppColors.mainText,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  marginLeft: 12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  alignment: Alignment.centerLeft,
                ),
                TextWidget(
                  text: '连续签到3天额外获得10金币',
                  textColor: AppColors.summaryText2,
                  fontSize: 12,
                  marginTop: 2,
                  marginLeft: 12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  alignment: Alignment.centerLeft,
                )
              ],
            ),
          ),
          ContainerWidget(
            width: 71,
            height: 30,
            radius: 15,
            backgroundColor: AppColors.main,
            child: Row(
              children: [
                ImageWidget(
                  url: 'app/ic_gold',
                  width: 15,
                  height: 15,
                  marginLeft: 8,
                ),
                Expanded(
                  child: TextWidget(
                    text: '+10',
                    textColor: Colors.white,
                    fontSize: 12,
                    alignment: Alignment.centerRight,
                    marginRight: 12,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
