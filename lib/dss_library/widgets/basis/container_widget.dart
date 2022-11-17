import 'package:flutter/material.dart';

import '../../util/image_util.dart';

/// 优先明确的再笼统的，如：优先 paddingLeft 次取 padding
class ContainerWidget extends StatelessWidget {
  ContainerWidget({
    super.key,
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.backgroundColor,
    // 一旦设置了这个，最小最大宽高都失效，按最大的来
    this.alignment,
    this.backgroundImagePath,
    this.backgroundImageFormat,
    this.backgroundImageBoxFit = BoxFit.fill,
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
    this.child,
  });

  final double? width;
  final double? height;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  final Color? backgroundColor;
  final AlignmentGeometry? alignment;

  final String? backgroundImagePath;
  final ImageFormat? backgroundImageFormat;
  final BoxFit? backgroundImageBoxFit;

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

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      constraints: BoxConstraints(
        minWidth: width ?? minWidth ?? 0.0,
        maxWidth: width ?? maxWidth ?? double.infinity,
        minHeight: height ?? minHeight ?? 0.0,
        maxHeight: height ?? maxHeight ?? double.infinity,
      ),
      alignment: alignment,
      padding: EdgeInsets.only(
        left: paddingLeft ?? paddingHorizontal ?? padding ?? 0.0,
        right: paddingRight ?? paddingHorizontal ?? padding ?? 0.0,
        top: paddingTop ?? paddingVertical ?? padding ?? 0.0,
        bottom: paddingBottom ?? paddingVertical ?? padding ?? 0.0,
      ),
      margin: EdgeInsets.only(
        left: marginLeft ?? marginHorizontal ?? margin ?? 0.0,
        right: marginRight ?? marginHorizontal ?? margin ?? 0.0,
        top: marginTop ?? marginVertical ?? margin ?? 0.0,
        bottom: marginBottom ?? marginVertical ?? margin ?? 0.0,
      ),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radiusTopLeft ?? radius ?? 0.0),
            topRight: Radius.circular(radiusTopRight ?? radius ?? 0.0),
            bottomLeft: Radius.circular(radiusBottomLeft ?? radius ?? 0.0),
            bottomRight: Radius.circular(radiusBottomRight ?? radius ?? 0.0),
          ),
          border: Border(
            top: borderSideTop ?? borderSide ?? BorderSide.none,
            bottom: borderSideBottom ?? borderSide ?? BorderSide.none,
            left: borderSideLeft ?? borderSide ?? BorderSide.none,
            right: borderSideRight ?? borderSide ?? BorderSide.none,
          ),
          image: backgroundImagePath == null
              ? null
              : DecorationImage(
                  fit: backgroundImageBoxFit,
                  image: AssetImage(
                    ImageUtils.getImgPath(
                      backgroundImagePath ?? '',
                      format: backgroundImageFormat ?? ImageFormat.png,
                    ),
                  ),
                )),
      child: child,
    );
    return GestureDetector(
      onTap: onPressed,
      child: content,
    );
  }
}
