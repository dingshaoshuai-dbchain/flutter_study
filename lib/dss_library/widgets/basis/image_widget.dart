import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../util/image_util.dart';
import 'container_widget.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({
    super.key,
    required this.url,
    this.fit = BoxFit.contain,
    this.placeholder,
    this.format = ImageFormat.png,
    this.imageRadius,
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.backgroundColor,
    this.padding,
    this.paddingHorizontal,
    this.paddingVertical,
    this.paddingLeft,
    this.paddingTop,
    this.paddingRight,
    this.paddingBottom,
    this.margin,
    this.marginHorizontal,
    this.marginVertical,
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
    this.onPressed,
  });

  final String url;
  final BoxFit fit;
  final String? placeholder;
  final ImageFormat format;

  final double? imageRadius;

  final double? width;
  final double? height;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  final Color? backgroundColor;

  final double? padding;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;

  final double? margin;
  final double? marginHorizontal;
  final double? marginVertical;
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

  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      width: width,
      height: height,
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
      backgroundColor: backgroundColor,
      padding: padding,
      paddingHorizontal: paddingHorizontal,
      paddingVertical: paddingVertical,
      paddingTop: paddingTop,
      paddingBottom: paddingBottom,
      paddingLeft: paddingLeft,
      paddingRight: paddingRight,
      margin: margin,
      marginHorizontal: marginHorizontal,
      marginVertical: marginVertical,
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
      onPressed: onPressed,
      child: _buildChild(),
    );
  }

  Widget? _buildChild() {
    final Widget child;
    if (url.startsWith('http')) {
      final Widget? holder = placeholder != null
          ? _buildAssetImage(placeholder!, fit, format)
          : null;
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
    Widget? holder,
  ) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: holder != null ? (_, __) => holder : null,
      errorWidget: holder != null ? (_, __, dynamic error) => holder : null,
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
