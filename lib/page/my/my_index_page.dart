import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/page/my/widgets/menu_item_widget.dart';
import 'package:youliao/res_app/app_colors.dart';
import 'package:youliao/util/image_util.dart';
import 'package:youliao/util/toast_util.dart';
import 'package:youliao/widgets/basis/container_widget.dart';
import 'package:youliao/widgets/basis/image_widget.dart';
import 'package:youliao/widgets/basis/text_compose_widget.dart';
import 'package:youliao/widgets/basis/text_widget.dart';
import 'package:youliao/widgets/gaps.dart';
import 'package:youliao/widgets/status_bar.dart';

import '../../util/log_utils.dart';

class MyIndexPage extends StatefulWidget {
  const MyIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyIndexPageState();
}

class _MyIndexPageState extends State<MyIndexPage> {
  final Widget _topWidget = _TopWidget();
  final Widget _functionMenuWidget = _FunctionMenuWidget();
  final Widget _taskMenuWidget = _TaskMenuWidget();
  final Widget _menuListWidget = _MenuListWidget();

  Widget build(BuildContext context) {
    print("build - MyIndexPage");
    return Container(
      child: Column(children: [
        // 用户信息
        _topWidget,
        // 我的订单、我的收藏、邀请好友
        _functionMenuWidget,
        // 任务中心、活动广场
        _taskMenuWidget,
        // 意见反馈、申请成为专家..
        Expanded(
          child: ContainerWidget(
            backgroundColor: Colors.white,
            marginTop: 10.w,
            paddingVertical: 5.w,
            child: _menuListWidget,
          ),
        ),
      ]),
    );
  }
}

class _TopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageWidget(
          url: 'my/bg_my_top',
          format: ImageFormat.webp,
          width: 1.sw,
          height: 261.h,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 261.h,
          child: Column(
            children: [
              const StatusBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ImageWidget(
                    url: 'my/ic_settings',
                    width: 40.w,
                    height: 40.w,
                    padding: 10.w,
                    onPressed: () {
                      Toast.show('设置');
                    },
                  ),
                  ImageWidget(
                    url: 'my/ic_message',
                    width: 40.w,
                    height: 40.w,
                    padding: 10.w,
                    marginRight: 12.w,
                    onPressed: () {
                      Toast.show('消息');
                    },
                  ),
                ],
              ),
              Gaps.vGapValue(17.w),
              Row(
                children: [
                  ImageWidget(
                    url: 'app/ic_default_avatar',
                    width: 68.w,
                    height: 68.w,
                    radius: 23.w,
                    borderSide:
                        BorderSide(color: const Color(0xFFCFEBE6), width: 2.w),
                    marginLeft: 15.w,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 11.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: TextWidget(
                                text: '二郎真君',
                                textColor: AppColors.color_181818,
                                alignment: Alignment.centerLeft,
                                fontSize: 18.sp,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                              )),
                              Stack(
                                children: [
                                  TextWidget(
                                    text: '每日签到',
                                    textColor: const Color(0xFFF54F2A),
                                    fontSize: 13.sp,
                                    width: 102.w,
                                    height: 28.w,
                                    backgroundColor: Colors.white,
                                    marginTop: 8.w,
                                    radiusTopLeft: 14.w,
                                    paddingLeft: 30.w,
                                    radiusBottomLeft: 14.w,
                                  ),
                                  ImageWidget(
                                    url: 'my/ic_red_package',
                                    width: 30.w,
                                    height: 30.w,
                                    marginLeft: 6.w,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: '已注册10天',
                                width: 65.w,
                                height: 16.w,
                                textColor: AppColors.color5C6274,
                                fontSize: 9.sp,
                                maxLines: 1,
                                radius: 8.w,
                                paddingHorizontal: 2.w,
                                backgroundColor: Colors.white,
                                marginTop: 5.w,
                              )
                            ],
                          ),
                          Gaps.vGap5,
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: '0',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: AppColors.color_181818),
                                  ),
                                  TextSpan(
                                    text: ' 关注 ',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: AppColors.color6A6A6A),
                                  )
                                ]),
                              ),
                              const Spacer(),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: '0',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: AppColors.color_181818),
                                  ),
                                  TextSpan(
                                    text: ' 消息 ',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: AppColors.color6A6A6A),
                                  )
                                ]),
                              ),
                              const Spacer(),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: '0',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        color: AppColors.color_181818),
                                  ),
                                  TextSpan(
                                    text: ' 粉丝 ',
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: AppColors.color6A6A6A),
                                  )
                                ]),
                              ),
                              Gaps.hGapValue(42.w)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              ContainerWidget(
                height: 55.w,
                backgroundImagePath: 'my/bg_gold_recharge',
                backgroundImageFormat: ImageFormat.webp,
                backgroundImageBoxFit: BoxFit.fill,
                marginHorizontal: 13.w,
                marginBottom: 5.w,
                child: Row(
                  children: [
                    ImageWidget(
                      url: 'app/ic_gold',
                      width: 20.w,
                      height: 20.w,
                      marginLeft: 18.w,
                    ),
                    TextWidget(
                      text: '我的金币：',
                      textColor: const Color(0xFFDAC888),
                      fontSize: 15.sp,
                      marginLeft: 12.w,
                    ),
                    Expanded(
                      child: TextWidget(
                        text: '100',
                        textColor: Color(0xFFFBE846),
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w700,
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    ImageWidget(
                      url: 'my/bg_recharge_btn',
                      width: 86.w,
                      height: 36.w,
                      marginRight: 22.w,
                      onPressed: () {
                        Toast.show('立即充值');
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _FunctionMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      height: 72.w,
      backgroundColor: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextComposeWidget(
              text: '我的订单',
              textColor: AppColors.color_181818,
              fontSize: 11.sp,
              alignment: Alignment.center,
              topWidget: ImageWidget(
                url: 'my/ic_order',
                width: 24.w,
                height: 24.w,
                marginBottom: 6.w,
              ),
              onPressed: () {
                Toast.show('我的订单');
              },
            ),
          ),
          Expanded(
            child: TextComposeWidget(
              text: '我的收藏',
              textColor: AppColors.color_181818,
              fontSize: 11.sp,
              alignment: Alignment.center,
              topWidget: ImageWidget(
                url: 'my/ic_collected',
                width: 24.w,
                height: 24.w,
                marginBottom: 6.w,
              ),
              onPressed: () {
                Toast.show('我的收藏');
              },
            ),
          ),
          Expanded(
            child: TextComposeWidget(
              text: '邀请好友',
              textColor: AppColors.color_181818,
              fontSize: 11.sp,
              alignment: Alignment.center,
              topWidget: ImageWidget(
                url: 'my/ic_invite_friend',
                width: 24.w,
                height: 24.w,
                marginBottom: 6.w,
              ),
              onPressed: () {
                Toast.show('邀请好友');
              },
            ),
          )
        ],
      ),
    );
  }
}

class _TaskMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Log.d('build - _TaskMenuWidget');
    return ContainerWidget(
      height: 105.w,
      backgroundColor: Colors.white,
      marginTop: 10.w,
      paddingVertical: 15.w,
      paddingHorizontal: 10.w,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ContainerWidget(
              backgroundImagePath: 'my/bg_task_center_my',
              onPressed: () {
                Toast.show('任务中心');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: '任务中心',
                    textColor: Colors.white,
                    marginTop: 10.h,
                    fontSize: 20.sp,
                    alignment: Alignment.centerLeft,
                    marginLeft: 13.w,
                    fontWeight: FontWeight.w600,
                  ),
                  TextWidget(
                    text: '立即查看',
                    textColor: const Color(0xFFE6715F),
                    fontSize: 9.sp,
                    width: 45.w,
                    height: 15.w,
                    marginLeft: 13.w,
                    backgroundColor: Colors.white,
                    marginTop: 6.w,
                    radius: 2.w,
                  )
                ],
              ),
            ),
          ),
          Gaps.hGapValue(12.w),
          Expanded(
            flex: 2,
            child: ContainerWidget(
              backgroundImagePath: 'my/bg_activity_center',
              onPressed: () {
                Toast.show('活动广场');
              },
              child: Column(
                children: [
                  TextWidget(
                    text: '活动广场',
                    textColor: Colors.white,
                    marginTop: 10.h,
                    fontSize: 20.sp,
                    alignment: Alignment.centerLeft,
                    marginLeft: 13.w,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextWidget(
                          text: '好友下单力得金币',
                          textColor: Colors.white,
                          fontSize: 11.sp,
                          marginTop: 4.w,
                          marginLeft: 13.w,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      TextWidget(
                        text: '立即查看',
                        textColor: Colors.white,
                        fontSize: 9.sp,
                        width: 45.w,
                        height: 15.w,
                        marginLeft: 13.w,
                        borderSide:
                            BorderSide(color: Colors.white, width: 0.5.w),
                        marginTop: 4.w,
                        radius: 2.w,
                        marginRight: 8.w,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MenuListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Log.d('build - _MenuListWidget');
    return ContainerWidget(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          MenuItemWidget(
            url: 'my/ic_feedback',
            text: '意见反馈',
            onPressed: () {
              Toast.show('意见反馈');
            },
          ),
          Gaps.hLine(indent: 48.w, endIndent: 38.w),
          MenuItemWidget(
            url: 'my/ic_person',
            text: '申请成为专家',
            onPressed: () {
              Toast.show('申请成为专家');
            },
          ),
          Gaps.hLine(indent: 48.w, endIndent: 38.w),
          MenuItemWidget(
            url: 'my/ic_settings',
            text: '设置',
            onPressed: () {
              Toast.show('设置');
            },
          ),
        ],
      ),
    );
  }
}