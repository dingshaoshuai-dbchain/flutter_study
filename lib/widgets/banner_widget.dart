
import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dss_library/res/colors.dart';
import '../dss_library/widgets/basis/image_widget.dart';
import '../res/app_colors.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<StatefulWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget>{

  final _bannerList = [
    'https://live-yq.oss-cn-shenzhen.aliyuncs.com/cos/20221017213350486054/a8e11b6d-4b58-4fc0-9ae0-28e9f6958ae2.png?version=3',
    'https://live-yq.oss-cn-shenzhen.aliyuncs.com/cos/20221017200019301079/389f57a9-fe97-4d6a-92c9-22f282cdeb60.png?version=3',
    'https://live-yq.oss-cn-shenzhen.aliyuncs.com/cos/20221018173031992022/719753a7-4672-4b79-9610-2e2d9b83a566.png?version=3',
  ].map((e) => ImageWidget(
    url: e,
    fit: BoxFit.cover,
  ));

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      // 比例
      aspectRatio: 3.3 / 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.w),
        child: Swiper(
          // 指示器样式
          indicator: CircleSwiperIndicator(
              spacing: 8.w,
              radius: 3.w,
              itemActiveColor: Colors.white,
              itemColor: AppColors.summaryText2,
              padding: EdgeInsets.only(bottom: 10.w)),
          // 轮播图资源
          children: _bannerList.toList(),
        ),
      ),
    );
  }
}