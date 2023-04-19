import 'package:dss_base_flutter/dss_base_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/api/expert_api.dart';
import 'package:youliao/global/match_mode.dart';
import 'package:youliao/models/expert_bean.dart';
import 'package:youliao/res/app_colors.dart';

/// 顶部推荐专家
class RecommendExpertWidget extends StatefulWidget {
  const RecommendExpertWidget({super.key});

  @override
  State<StatefulWidget> createState() => _RecommendExpertWidgetState();
}

class _RecommendExpertWidgetState extends BaseDataWidgetState<RecommendExpertWidget> {
  List<ExpertBean> _data = [];

  @override
  void initData() {
    HttpUtil.instance.simpleCallback(
      future: ExpertApi.instance.getExpertList(
        matchMode: MatchMode.all,
      ),
      convert: (data) {
        return ExpertApi.instance.convertByDynamic(data);
      },
      onSuccess: (data) {
        setState(() {
          _data = data;
        });
      },
      onFailure: (code, msg) {
        setState(() {});
      },
    );
  }

  @override
  bool checkShowPlace(BuildContext context) => _data.isEmpty;

  @override
  Widget onBuildContentWidget(BuildContext context) {
    return Column(
      children: [
        _buildTitle(context),
        Gaps.vGap13,
        _buildBody(context, _data),
        Gaps.vGap14,
      ],
    );
  }

  /// 标题区域
  Widget _buildTitle(BuildContext context) {
    return Row(
      children: [
        TextComposeWidget(
          text: '推荐专家',
          textColor: Colors.white,
          fontSize: 16.sp,
          marginLeft: 20.w,
          fontWeight: FontWeightUtil.pingFangSCSemibold,
          leftWidget: ImageWidget(
            url: 'ic_recommend_expert',
            width: 14.w,
            height: 14.w,
            marginRight: 4.5.w,
            fit: BoxFit.fill,
          ),
        ),
        const Spacer(),
        TextWidget(
          text: '更多专家 >',
          textColor: AppColors.summaryText2,
          fontSize: 10.sp,
          paddingHorizontal: 14.w,
          paddingVertical: 5.w,
          onPressed: () {
            Toast.show('更多专家');
          },
        ),
      ],
    );
  }

  /// 列表区域
  Widget _buildBody(BuildContext context, List<ExpertBean> data) {
    return SizedBox(
      // TODO 屏幕适配问题，高度这样搞不靠谱
      height: 138.h,
      child: ListView.separated(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(context, index, data.length, data[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Gaps.hGap10;
        },
      ),
    );
  }

  /// 专家列表 item
  Widget _buildItem(BuildContext context,
      int index,
      int count,
      ExpertBean bean,) {
    double? marginLeft = index == 0 ? 12.5.w : null;
    double? marginRight = index == count - 1 ? 12.5.w : null;
    return ContainerWidget(
      width: 97.w,
      backgroundColor: Colors.white,
      radius: 8.w,
      marginLeft: marginLeft,
      marginRight: marginRight,
      child: Column(
        children: [
          Gaps.vGap10,
          Stack(
            alignment: Alignment.center,
            children: [
              ImageWidget(
                url: bean.picUrl,
                width: 56.w,
                height: 56.w,
                marginBottom: 8.w,
                imageRadius: 28.w,
                onPressed: () {
                  Toast.show('点击了专家');
                },
              ),
              Positioned(
                bottom: 2.w,
                left: 8.w,
                right: 8.w,
                child: TextWidget(
                  text: bean.des,
                  textColor: Colors.white,
                  fontSize: 8.sp,
                  width: 42.w,
                  paddingVertical: 1.w,
                  radius: 2.w,
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.w,
                      /*strokeAlign: StrokeAlign.outside*/),
                  backgroundColor: AppColors.main,
                ),
              )
            ],
          ),
          TextWidget(
            text: bean.name,
            textColor: AppColors.mainText,
            fontSize: 12.sp,
            fontWeight: FontWeightUtil.pingFangSCSemibold,
            marginHorizontal: 2.w,
            marginTop: 2.w,
            alignment: Alignment.topCenter,
          ),
          TextWidget(
            text: '平台人气王',
            textColor: AppColors.summaryText2,
            fontSize: 8.sp,
            marginTop: 5.w,
          ),
          ImageWidget(
            url: 'ic_expert_attention',
            width: 35.w,
            height: 20.w,
            marginTop: 6.w,
            onPressed: () {
              Toast.show('关注专家');
            },
          ),
          Gaps.vGap8,
        ],
      ),
    );
  }
}
