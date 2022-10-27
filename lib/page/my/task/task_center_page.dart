import 'package:flutter/material.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/util/navigator_util.dart';
import 'package:youliao/util/toast_util.dart';
import 'package:youliao/widgets_app/sign/sign_item.dart';
import 'package:youliao/widgets_app/sign/sign_item7.dart';
import 'package:youliao/widgets_app/sign/task_item.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/basis/image_widget.dart';
import 'package:youliao/widgets/image_back.dart';
import 'package:youliao/widgets/status_bar.dart';

import '../../../../widgets/basis/text_widget.dart';
import '../../../../widgets/gaps.dart';

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
          ImageWidget(url: 'my/task/bg_task_center'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StatusBar(),
              const ImageBack(isBlack: false),
              _buildUserInfo(context),
              Gaps.vGapValue(15),
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    // 滑动到边界效果
                    // Android 微光效果：ClampingScrollPhysics
                    // iOS 回弹效果：BouncingScrollPhysics
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Gaps.vGapValue(18),
                      _buildContent(
                        title: '连续签到送好礼',
                        child: _buildSign(context),
                      ),
                      Gaps.vGapValue(12),
                      _buildContent(
                        title: '做任务赚金币',
                        child: _buildTask(context),
                      ),
                      Gaps.vGap32
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildUserInfo(BuildContext context) {
  return ContainerWidget(
    width: double.maxFinite,
    height: 52,
    marginLeft: 16,
    marginRight: 16,
    marginTop: 25,
    child: Row(
      children: [
        ImageWidget(
          url: 'app/ic_default_avatar',
          width: 50,
          height: 50,
          imageRadius: 25,
          radius: 25,
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
          fit: BoxFit.cover,
          onTap: () => {
            Toast.show('点击了头像'),
          },
        ),
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
                TextWidget(
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
        ContainerWidget(
          width: 82,
          height: 41,
          borderSide: const BorderSide(color: Color(0xFF7E8398), width: 1),
          radius: 12,
          child: Row(
            children: [
              ImageWidget(
                url: 'app/ic_gold',
                width: 24,
                height: 24,
                marginLeft: 10,
              ),
              Expanded(
                child: TextWidget(
                  text: '100',
                  alignment: Alignment.centerLeft,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  paddingLeft: 5,
                  paddingRight: 2,
                  textColor: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildSign(BuildContext context) {
  return ContainerWidget(
      alignment: Alignment.center,
      marginTop: 15,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: SignItemWidget()),
              Gaps.hGapValue(12),
              Expanded(child: SignItemWidget()),
              Gaps.hGapValue(12),
              Expanded(child: SignItemWidget()),
              Gaps.hGapValue(12),
              Expanded(child: SignItemWidget()),
            ],
          ),
          Gaps.vGapValue(12),
          Row(
            children: [
              Expanded(child: SignItemWidget()),
              Gaps.hGapValue(12),
              Expanded(child: SignItemWidget()),
              Gaps.hGapValue(12),
              Expanded(flex: 2, child: SignItem7Widget()),
            ],
          ),
        ],
      ));
}

Widget _buildTask(BuildContext context) {
  return ContainerWidget(
    alignment: Alignment.center,
    marginTop: 15,
    child: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        // 加上这玩意，就不会出现内部的微光效果
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return TaskItemWidget();
        },
      ),
    ),
  );
}

Widget _buildContent({
  required String title,
  required Widget child,
}) {
  return ContainerWidget(
    marginLeft: 16,
    marginRight: 16,
    backgroundColor: Colors.white,
    radius: 12,
    paddingLeft: 15,
    paddingRight: 15,
    paddingTop: 16,
    paddingBottom: 13,
    child: Column(
      children: [
        TextWidget(
          text: title,
          textColor: AppColors.color_181818,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          alignment: Alignment.centerLeft,
        ),
        child
      ],
    ),
  );
}
