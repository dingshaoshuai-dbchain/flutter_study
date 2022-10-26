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
      this.child});

  final double? width;
  final double? height;

  final Color? backgroundColor;
  final AlignmentGeometry? alignment;

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

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: alignment,
        padding: EdgeInsets.only(
          left: paddingLeft ?? padding ?? 0.0,
          right: paddingRight ?? padding ?? 0.0,
          top: paddingTop ?? padding ?? 0.0,
          bottom: paddingBottom ?? padding ?? 0.0,
        ),
        margin: EdgeInsets.only(
          left: marginLeft ?? margin ?? 0.0,
          right: marginRight ?? margin ?? 0.0,
          top: marginTop ?? margin ?? 0.0,
          bottom: marginBottom ?? margin ?? 0.0,
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
      ),
    );
  }
}
