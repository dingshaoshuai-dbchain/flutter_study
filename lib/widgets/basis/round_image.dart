import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../util/image_util.dart';
import 'round_container.dart';

class RoundImage extends StatelessWidget {
  RoundImage({
    super.key,
    required this.url,
    this.fit = BoxFit.contain,
    this.placeholder = 'none',
    this.format = ImageFormat.png,
    this.imageRadius,
    this.width,
    this.height,
    this.backgroundColor,
    this.padding,
    this.paddingLeft,
    this.paddingTop,
    this.paddingRight,
    this.paddingBottom,
    this.margin,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.radius,
    this.radiusTopLeft,
    this.radiusTopRight,
    this.radiusBottomLeft,
    this.radiusBottomRight,
    this.borderSide,
    this.borderSideTop,
    this.borderSideBottom,
    this.borderSideLeft,
    this.borderSideRight,
    this.onTap,
  });

  final String url;
  final BoxFit fit;
  final String placeholder;
  final ImageFormat format;

  final double? imageRadius;

  final double? width;
  final double? height;

  final Color? backgroundColor;

  final double? padding;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;

  final double? margin;
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;

  final double? radius;
  final double? radiusTopLeft;
  final double? radiusTopRight;
  final double? radiusBottomLeft;
  final double? radiusBottomRight;

  final BorderSide? borderSide;
  final BorderSide? borderSideTop;
  final BorderSide? borderSideBottom;
  final BorderSide? borderSideLeft;
  final BorderSide? borderSideRight;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      width: width,
      height: height,
      backgroundColor: backgroundColor,
      padding: padding,
      paddingTop: paddingTop,
      paddingBottom: paddingBottom,
      paddingLeft: paddingLeft,
      paddingRight: paddingRight,
      margin: margin,
      marginTop: marginTop,
      marginBottom: marginBottom,
      marginLeft: marginLeft,
      marginRight: marginRight,
      radius: radius,
      radiusTopLeft: radiusTopLeft,
      radiusTopRight: radiusTopRight,
      radiusBottomLeft: radiusBottomLeft,
      radiusBottomRight: radiusBottomRight,
      borderSide: borderSide,
      borderSideTop: borderSideTop,
      borderSideBottom: borderSideBottom,
      borderSideLeft: borderSideLeft,
      borderSideRight: borderSideRight,
      onTap: onTap,
      child: _buildChild(),
    );
  }

  Widget? _buildChild() {
    final Widget child;
    if (url.startsWith('http')) {
      final Widget holder = _buildAssetImage(placeholder, fit, format);
      child = _buildNetworkImage(url, fit, format, holder);
    } else {
      child = _buildAssetImage(url, fit, format);
    }
    if (imageRadius == null) return child;
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageRadius ?? 0),
      child: child,
    );
  }

  /// 加载网络图片
  Widget _buildNetworkImage(
    String url,
    BoxFit fit,
    ImageFormat format,
    Widget holder,
  ) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (_, __) => holder,
      errorWidget: (_, __, dynamic error) => holder,
      fit: fit,
    );
  }

  /// 加载本地图片
  Widget _buildAssetImage(String path, BoxFit fit, ImageFormat format) {
    return Image.asset(
      ImageUtils.getImgPath(path, format: format),
      fit: fit,
    );
  }
}
