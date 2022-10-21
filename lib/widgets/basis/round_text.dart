import 'package:flutter/cupertino.dart';

import 'round_container.dart';

class RoundText extends StatelessWidget {
  const RoundText({
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
      alignment: alignment,
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
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
