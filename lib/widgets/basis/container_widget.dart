import 'package:flutter/material.dart';

/// 优先明确的再笼统的，如：优先 paddingLeft 次取 padding
class ContainerWidget extends StatelessWidget {
  ContainerWidget(
      {super.key,
      this.width,
      this.height,
      this.backgroundColor,
      this.alignment,
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
      this.child});

  final double? width;
  final double? height;

  final Color? backgroundColor;
  final AlignmentGeometry? alignment;

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
      width: width,
      height: height,
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
          )),
      child: child,
    );
    return GestureDetector(
      onTap: onPressed,
      child: content,
    );
  }
}
