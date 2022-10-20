import 'package:flutter/cupertino.dart';

import 'RoundContainer.dart';

class RoundText extends StatefulWidget {
  const RoundText({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    this.alignment = Alignment.center,
    this.maxLines,
    this.overflow,
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
  State<StatefulWidget> createState() => _RoundTextState();
}

class _RoundTextState extends State<RoundText> {
  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      width: widget.width,
      height: widget.height,
      backgroundColor: widget.backgroundColor,
      padding: widget.padding,
      paddingTop: widget.paddingTop,
      paddingBottom: widget.paddingBottom,
      paddingLeft: widget.paddingLeft,
      paddingRight: widget.paddingRight,
      margin: widget.margin,
      marginTop: widget.marginTop,
      marginBottom: widget.marginBottom,
      marginLeft: widget.marginLeft,
      marginRight: widget.marginRight,
      radius: widget.radius,
      radiusTopLeft: widget.radiusTopLeft,
      radiusTopRight: widget.radiusTopRight,
      radiusBottomLeft: widget.radiusBottomLeft,
      radiusBottomRight: widget.radiusBottomRight,
      borderSide: widget.borderSide,
      borderSideTop: widget.borderSideTop,
      borderSideBottom: widget.borderSideBottom,
      borderSideLeft: widget.borderSideLeft,
      borderSideRight: widget.borderSideRight,
      child: Align(
        alignment: widget.alignment,
        child: Text(
          widget.text,
          maxLines: widget.maxLines,
          overflow: widget.overflow,
          style: TextStyle(color: widget.textColor, fontSize: widget.fontSize),
        ),
      ),
    );
  }
}
