import 'package:dss_base_flutter/util/image_util.dart';
import 'package:flutter/material.dart';

import 'container_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.fontFamily,
    this.textAlign = TextAlign.center,
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.alignment,
    this.backgroundColor,
    this.backgroundImagePath,
    this.backgroundImageFormat,
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

  final String text;
  final Color textColor;
  final double fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;

  final double? width;
  final double? height;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  final Alignment? alignment;

  final Color? backgroundColor;

  final String? backgroundImagePath;
  final ImageFormat? backgroundImageFormat;

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
      alignment: alignment,
      backgroundColor: backgroundColor,
      backgroundImagePath: backgroundImagePath,
      backgroundImageFormat: backgroundImageFormat,
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
      child: _buildChild(),
    );
  }

  Widget? _buildChild() {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        // 水波纹
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return Colors.white.withOpacity(0.12);
        }),
      ),
      child: Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
