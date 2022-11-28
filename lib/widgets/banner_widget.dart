import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youliao/api/common_api.dart';
import 'package:youliao/dss_library/util/toast_util.dart';
import 'package:youliao/dss_library/widgets/basis/text_widget.dart';

import '../dss_library/res/colors.dart';
import '../dss_library/widgets/basis/image_widget.dart';
import '../models/banner_bean.dart';
import '../res/app_colors.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    super.key,
    // 轮播图比例
    required this.aspectRatio,
    required this.locationId,
  });

  final double aspectRatio;
  final int locationId;

  @override
  State<StatefulWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  List<BannerBean> _bannerData = [];

  @override
  void initState() {
    super.initState();
    CommonApi.instance.getBanner(
      locationId: widget.locationId,
      onSuccess: (data) {
        setState(() {
          _bannerData = data;
        });
      },
      onFailure: (code, msg) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      // 比例
      aspectRatio: widget.aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.w),
        child: _bannerData.isEmpty ? _buildPlaceWidget() : _buildSwiper(),
      ),
    );
  }

  Widget _buildSwiper() {
    return Swiper(
      // 指示器样式
      indicator: CircleSwiperIndicator(
          spacing: 8.w,
          radius: 3.w,
          itemActiveColor: Colors.white,
          itemColor: AppColors.summaryText2,
          padding: EdgeInsets.only(bottom: 10.w)),
      // 轮播图资源
      children: _bannerData
          .map((e) => ImageWidget(
                url: e.imageUrl ?? '',
                fit: BoxFit.cover,
                onPressed: () {
                  Toast.show('跳转方式${e.redirectType}');
                },
              ))
          .toList(),
    );
  }

  Widget _buildPlaceWidget() {
    return TextWidget(
      text: '我是占位',
      textColor: AppColors.mainText,
      fontSize: 18.sp,
    );
  }
}