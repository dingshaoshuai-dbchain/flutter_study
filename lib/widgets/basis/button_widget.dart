import 'package:flutter/material.dart';

import 'container_widget.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    this.alignment = Alignment.center,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.width,
    this.height,
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

  final String text;
  final Color textColor;
  final double fontSize;
  final Alignment alignment;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  final double? width;
  final double? height;

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
      alignment: alignment,
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
      child: _buildChild(),
    );
  }

  Widget? _buildChild() {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        // 按钮大小
        minimumSize: ButtonStyleButton.allOrNull(
          const Size(
            double.infinity,
            double.infinity,
          ),
        ),
        // 水波纹
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return Colors.white.withOpacity(0.12);
        }),
      ),
      child: Text(
        text,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}