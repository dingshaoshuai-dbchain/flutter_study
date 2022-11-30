import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/util/font_family_util.dart';

import '../../../res/app_colors.dart';
import 'sign/sign_item.dart';
import 'sign/sign_item7.dart';

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
          ImageWidget(url: 'bg_task_center'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(
                title: '',
                isBlackStatusFontColor: false,
                backgroundColor: Colors.transparent,
                isBlackBack: false,
              ),
              _UserWidget(),
              Gaps.vGap15,
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
                      Gaps.vGap18,
                      _BlockWidget(
                        title: '连续签到送好礼',
                        child: _SignWidget(),
                      ),
                      Gaps.vGap12,
                      _BlockWidget(
                        title: '做任务赚金币',
                        child: _TaskWidget(),
                      ),
                      Gaps.vGapValue(32)
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

/// 用户信息
class _UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      height: 52.w,
      marginLeft: 16.w,
      marginRight: 16.w,
      marginTop: 25.w,
      child: Row(
        children: [
          ImageWidget(
            url: 'ic_default_avatar',
            width: 50.w,
            height: 50.w,
            imageRadius: 25.w,
            radius: 25.w,
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5.w,
            ),
            fit: BoxFit.cover,
            onPressed: () => {
              Toast.show('点击了头像'),
            },
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: '已连续签到',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: ' 1 ',
                          style: TextStyle(
                            color: AppColors.main,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: '天',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextWidget(
                    alignment: Alignment.centerLeft,
                    text: '明日签到可获得10金币',
                    textColor: const Color(0xFF7E8398),
                    fontSize: 12.sp,
                    marginTop: 3.w,
                  ),
                ],
              ),
            ),
          ),
          TextComposeWidget(
            text: '100',
            textColor: Colors.white,
            fontSize: 15.sp,
            width: 82.w,
            height: 41.w,
            radius: 12.w,
            fontFamily: FontFamilyUtil.din,
            borderSide: BorderSide(color: const Color(0xFF7E8398), width: 1.w),
            leftWidget: ImageWidget(
              url: 'ic_gold',
              width: 24.w,
              height: 24.w,
              marginRight: 10.w,
            ),
          )
        ],
      ),
    );
  }
}

/// 一块区域
class _BlockWidget extends StatelessWidget {
  const _BlockWidget({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
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
            textColor: AppColors.mainText,
            fontSize: 16,
            fontWeight: FontWeightUtil.pingFangSCSemibold,
            alignment: Alignment.centerLeft,
          ),
          child
        ],
      ),
    );
  }
}

/// 签到信息
class _SignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      alignment: Alignment.center,
      marginTop: 15.w,
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(child: SignItemWidget()),
              Gaps.hGap12,
              Expanded(child: SignItemWidget()),
              Gaps.hGap12,
              Expanded(child: SignItemWidget()),
              Gaps.hGap12,
              Expanded(child: SignItemWidget()),
            ],
          ),
          Gaps.vGap12,
          Row(
            children: [
              Expanded(child: SignItemWidget()),
              Gaps.hGap12,
              Expanded(child: SignItemWidget()),
              Gaps.hGap12,
              Expanded(flex: 2, child: SignItem7Widget()),
              // 咳咳.. 粘贴假装是一个
              ContainerWidget(
                width: 12,
                height: 80.w,
                backgroundColor: AppColors.mainBackground,
                radiusBottomRight: 6.w,
                radiusTopRight: 6.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 任务列表
class _TaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            return _TaskItemWidget();
          },
        ),
      ),
    );
  }
}

/// 任务 item
class _TaskItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<_TaskItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      paddingTop: 14,
      paddingBottom: 14,
      child: Row(
        children: [
          ImageWidget(
            url: 'ic_gold',
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
                  url: 'ic_gold',
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
