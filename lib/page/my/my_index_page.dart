import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:youliao/page/my/my_router.dart';
import 'package:youliao/page/my/widgets/menu_item_widget.dart';
import 'package:youliao/res/app_colors.dart';
import 'package:youliao/util/font_family_util.dart';

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

  @override
  Widget build(BuildContext context) {
    Log.d('build - MyIndexPage');
    return Stack(
      children: [
        // 背景图
        ImageWidget(
          url: 'bg_my_top',
          format: ImageFormat.webp,
          width: 1.sw,
          height: 261.h,
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            // 设置栏
            AppBarWidget(
              title: '',
              backgroundColor: Colors.transparent,
              isShowBack: false,
              rightMenuWidget: [
                // 设置
                AppBarMenuWidget(
                  icon: 'ic_settings',
                  onPressed: () {
                    Toast.show('设置');
                  },
                ),
                // 消息
                AppBarMenuWidget(
                  icon: 'ic_message',
                  onPressed: () {
                    Toast.show('消息');
                  },
                ),
                Gaps.hGap10
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // 用户信息
                    _topWidget,
                    // 我的订单、我的收藏、邀请好友
                    _functionMenuWidget,
                    // 任务中心、活动广场
                    _taskMenuWidget,
                    // 意见反馈、申请成为专家..
                    _menuListWidget,
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

/// 用户信息
class _TopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Log.d('build - _TopWidget');
    return Column(
      children: [
        // 用户信息
        _buildUserInfo(context),
        // 我的金币
        _buildGold(context),
      ],
    );
  }

  /// 用户信息
  Widget _buildUserInfo(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 17.w),
          child: Row(
            children: [
              ImageWidget(
                url: 'ic_default_avatar',
                width: 68.w,
                height: 68.w,
                radius: 23.w,
                borderSide:
                    BorderSide(color: const Color(0xFFCFEBE6), width: 2.w),
                marginLeft: 15.w,
                onPressed: () {
                  NavigatorUtil.push(context, MyRouter.loginPage);
                },
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 11.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: '二郎真君',
                        textColor: AppColors.mainText,
                        alignment: Alignment.centerLeft,
                        fontSize: 18.sp,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeightUtil.pingFangSCSemibold,
                        marginRight: 110.w,
                      ),
                      TextWidget(
                        text: '已注册10天',
                        textColor: const Color(0xFF5C6274),
                        fontSize: 9.sp,
                        maxLines: 1,
                        paddingVertical: 1.w,
                        radius: 8.w,
                        paddingHorizontal: 5.w,
                        backgroundColor: Colors.white,
                        marginTop: 5.w,
                        maxWidth: 100.w,
                      ),
                      Gaps.vGap5,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _buildNumber(context, '关注', "0", () {
                            Toast.show('关注');
                          }),
                          const Spacer(),
                          _buildNumber(context, '消息', "0", () {
                            Toast.show('消息');
                          }),
                          const Spacer(),
                          _buildNumber(context, '粉丝', "0", () {
                            Toast.show('粉丝');
                          }),
                          Gaps.hGapValue(42.w)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // 每日签到
        Positioned(
          right: 0,
          child: Stack(
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
                url: 'ic_red_package',
                width: 30.w,
                height: 30.w,
                marginLeft: 6.w,
              ),
            ],
          ),
        )
      ],
    );
  }

  /// 数量，如：0关注
  Widget _buildNumber(
    BuildContext context,
    String text,
    String number,
    GestureTapCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Text.rich(
        TextSpan(children: [
          TextSpan(
            text: number,
            style: TextStyle(
                fontWeight: FontWeightUtil.pingFangSCMedium,
                fontSize: 16.sp,
                color: AppColors.mainText),
          ),
          TextSpan(
            text: ' $text ',
            style: TextStyle(fontSize: 11.sp, color: AppColors.summaryText),
          )
        ]),
      ),
    );
  }

  /// 我的金币
  Widget _buildGold(BuildContext context) {
    return ContainerWidget(
      height: 55.w,
      backgroundImagePath: 'bg_gold_recharge',
      backgroundImageFormat: ImageFormat.webp,
      backgroundImageBoxFit: BoxFit.fill,
      marginHorizontal: 13.w,
      marginBottom: 5.w,
      marginTop: 44.w,
      child: Row(
        children: [
          ImageWidget(
            url: 'ic_gold',
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
              alignment: Alignment.centerLeft,
              fontFamily: FontFamilyUtil.din,
            ),
          ),
          ImageWidget(
            url: 'bg_recharge_btn',
            width: 86.w,
            height: 36.w,
            marginRight: 22.w,
            onPressed: () {
              Toast.show('立即充值');
            },
          )
        ],
      ),
    );
  }
}

/// 我的订单、我的收藏、邀请好友
class _FunctionMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Log.d('build - _FunctionMenuWidget');
    return ContainerWidget(
      height: 72.w,
      backgroundColor: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: _buildItem('我的订单', 'ic_order', () {
              Toast.show('我的订单');
            }),
          ),
          Expanded(
            child: _buildItem('我的收藏', 'ic_collected', () {
              Toast.show('我的收藏');
            }),
          ),
          Expanded(
            child: _buildItem('邀请好友', 'ic_invite_friend', () {
              Toast.show('邀请好友');
            }),
          )
        ],
      ),
    );
  }

  /// 菜单 item
  Widget _buildItem(String text, String icon, GestureTapCallback onPressed) {
    return TextComposeWidget(
      text: text,
      textColor: AppColors.mainText,
      fontSize: 11.sp,
      alignment: Alignment.center,
      topWidget: ImageWidget(
        url: icon,
        width: 24.w,
        height: 24.w,
        marginBottom: 6.w,
      ),
      onPressed: onPressed,
    );
  }
}

/// 任务中心、活动广场
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
            child: _buildTaskCenterWidget(context),
          ),
          Gaps.hGap12,
          Expanded(
            flex: 2,
            child: _buildActivity(context),
          )
        ],
      ),
    );
  }

  /// 任务中心
  Widget _buildTaskCenterWidget(BuildContext context) {
    return ContainerWidget(
      backgroundImagePath: 'bg_task_center_my',
      onPressed: () {
        NavigatorUtil.push(context, MyRouter.taskCenterPage);
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
            fontWeight: FontWeightUtil.pingFangSCSemibold,
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
    );
  }

  /// 活动广场
  Widget _buildActivity(BuildContext context) {
    return ContainerWidget(
      backgroundImagePath: 'bg_activity_center',
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
            fontWeight: FontWeightUtil.pingFangSCSemibold,
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
                borderSide: BorderSide(color: Colors.white, width: 0.5.w),
                marginTop: 4.w,
                radius: 2.w,
                marginRight: 8.w,
              )
            ],
          ),
        ],
      ),
    );
  }
}

/// 意见反馈、申请成为专家..
class _MenuListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Log.d('build - _MenuListWidget');
    return ContainerWidget(
      backgroundColor: Colors.white,
      marginTop: 10.w,
      paddingVertical: 5.w,
      child: Column(
        children: [
          MenuItemWidget(
            url: 'ic_feedback',
            text: '意见反馈',
            onPressed: () {
              Toast.show('意见反馈');
            },
          ),
          Gaps.hLine(indent: 48.w, endIndent: 38.w),
          MenuItemWidget(
            url: 'ic_person',
            text: '申请成为专家',
            onPressed: () {
              Toast.show('申请成为专家');
            },
          ),
          Gaps.hLine(indent: 48.w, endIndent: 38.w),
          MenuItemWidget(
            url: 'ic_settings',
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