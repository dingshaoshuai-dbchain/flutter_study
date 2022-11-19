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
      alignment: alignment,
      constraints: _getConstraints(),
      padding: _getPadding(),
      margin: _getMargin(),
      decoration: _getDecoration(),
      child: child,
    );
    if (onPressed == null) {
      return content;
    }
    return GestureDetector(
      onTap: onPressed,
      child: content,
    );
  }

  BoxConstraints? _getConstraints() {
    if (width != null ||
        height != null ||
        minWidth != null ||
        maxWidth != null ||
        minHeight != null ||
        maxHeight != null) {
      return BoxConstraints(
        minWidth: width ?? minWidth ?? 0.0,
        maxWidth: width ?? maxWidth ?? double.infinity,
        minHeight: height ?? minHeight ?? 0.0,
        maxHeight: height ?? maxHeight ?? double.infinity,
      );
    }
    return null;
  }

  EdgeInsetsGeometry? _getPadding() {
    if (padding != null ||
        paddingHorizontal != null ||
        paddingVertical != null ||
        paddingLeft != null ||
        paddingRight != null ||
        paddingTop != null ||
        paddingBottom != null) {
      return EdgeInsets.only(
        left: paddingLeft ?? paddingHorizontal ?? padding ?? 0.0,
        right: paddingRight ?? paddingHorizontal ?? padding ?? 0.0,
        top: paddingTop ?? paddingVertical ?? padding ?? 0.0,
        bottom: paddingBottom ?? paddingVertical ?? padding ?? 0.0,
      );
    }
    return null;
  }

  EdgeInsetsGeometry? _getMargin() {
    if (margin != null ||
        marginHorizontal != null ||
        marginVertical != null ||
        marginLeft != null ||
        marginRight != null ||
        marginTop != null ||
        marginBottom != null) {
      return EdgeInsets.only(
        left: marginLeft ?? marginHorizontal ?? margin ?? 0.0,
        right: marginRight ?? marginHorizontal ?? margin ?? 0.0,
        top: marginTop ?? marginVertical ?? margin ?? 0.0,
        bottom: marginBottom ?? marginVertical ?? margin ?? 0.0,
      );
    }
    return null;
  }

  Decoration? _getDecoration() {
    BorderRadiusGeometry? borderRadius = _getBorderRadius();
    Border? border = _getBorder();
    DecorationImage? image = _getDecorationImage();
    if (backgroundColor != null ||
        borderRadius != null ||
        border != null ||
        image != null) {
      return BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: border,
        image: image,
      );
    }
    return null;
  }

  BorderRadiusGeometry? _getBorderRadius() {
    double tl = radiusTopLeft ?? radius ?? 0.0;
    double tr = radiusTopRight ?? radius ?? 0.0;
    double bl = radiusBottomLeft ?? radius ?? 0.0;
    double br = radiusBottomRight ?? radius ?? 0.0;
    if (tl > 0 || tr > 0 || bl > 0 || br > 0) {
      return BorderRadius.only(
          topLeft: Radius.circular(tl),
          topRight: Radius.circular(tr),
          bottomLeft: Radius.circular(bl),
          bottomRight: Radius.circular(br));
    }
    return null;
  }

  Border? _getBorder() {
    BorderSide getBorderSide(BorderSide? value) =>
        value ?? borderSide ?? BorderSide.none;

    BorderSide top = getBorderSide(borderSideTop);
    BorderSide bottom = getBorderSide(borderSideBottom);
    BorderSide left = getBorderSide(borderSideLeft);
    BorderSide right = getBorderSide(borderSideRight);
    if (top != BorderSide.none ||
        bottom != BorderSide.none ||
        left != BorderSide.none ||
        right != BorderSide.none) {
      return Border(top: top, bottom: bottom, left: left, right: right);
    }
    return null;
  }

  DecorationImage? _getDecorationImage() {
    if (backgroundImagePath != null) {
      return DecorationImage(
        fit: backgroundImageBoxFit,
        image: AssetImage(
          ImageUtils.getImgPath(
            backgroundImagePath ?? '',
            format: backgroundImageFormat ?? ImageFormat.png,
          ),
        ),
      );
    }
    return null;
  }
}
