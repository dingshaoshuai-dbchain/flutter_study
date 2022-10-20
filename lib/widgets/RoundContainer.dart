import 'package:flutter/cupertino.dart';

/// 优先明确的再笼统的，如：优先 paddingLeft 次取 padding
class RoundContainer extends StatefulWidget {
  const RoundContainer(
      {super.key,
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
      this.child});

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

  final Widget? child;

  @override
  State<StatefulWidget> createState() => _RoundContainerState();
}

class _RoundContainerState extends State<RoundContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.only(
        left: widget.paddingLeft ?? widget.padding ?? 0.0,
        right: widget.paddingRight ?? widget.padding ?? 0.0,
        top: widget.paddingTop ?? widget.padding ?? 0.0,
        bottom: widget.paddingBottom ?? widget.padding ?? 0.0,
      ),
      margin: EdgeInsets.only(
        left: widget.marginLeft ?? widget.margin ?? 0.0,
        right: widget.marginRight ?? widget.margin ?? 0.0,
        top: widget.marginTop ?? widget.margin ?? 0.0,
        bottom: widget.marginBottom ?? widget.margin ?? 0.0,
      ),
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft:
                Radius.circular(widget.radiusTopLeft ?? widget.radius ?? 0.0),
            topRight:
                Radius.circular(widget.radiusTopRight ?? widget.radius ?? 0.0),
            bottomLeft: Radius.circular(
                widget.radiusBottomLeft ?? widget.radius ?? 0.0),
            bottomRight: Radius.circular(
                widget.radiusBottomRight ?? widget.radius ?? 0.0),
          ),
          border: Border(
            top: widget.borderSideTop ?? widget.borderSide ?? BorderSide.none,
            bottom:
                widget.borderSideBottom ?? widget.borderSide ?? BorderSide.none,
            left: widget.borderSideLeft ?? widget.borderSide ?? BorderSide.none,
            right:
                widget.borderSideRight ?? widget.borderSide ?? BorderSide.none,
          )),
      child: widget.child,
    );
  }
}
