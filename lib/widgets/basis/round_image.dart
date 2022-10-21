import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../util/image_util.dart';
import 'round_container.dart';

class RoundImage extends StatelessWidget {
  const RoundImage({
    super.key,
    required this.url,
    this.fit = BoxFit.contain,
    this.placeholder = 'none',
    this.format = ImageFormat.png,
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
  });

  final String url;
  final BoxFit fit;
  final String placeholder;
  final ImageFormat format;

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
      child: _buildChild(),
    );
  }

  Widget? _buildChild() {
    if (url.startsWith('http')) {
      final Widget holder = _buildAssetImage(placeholder, fit, format);
      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (_, __) => holder,
        errorWidget: (_, __, dynamic error) => holder,
        fit: fit,
      );
    } else {
      return _buildAssetImage(url, fit, format);
    }
  }

  Widget _buildAssetImage(String path, BoxFit fit, ImageFormat format) {
    return Image.asset(
      ImageUtils.getImgPath(path, format: format),
      fit: fit,
    );
  }
}
