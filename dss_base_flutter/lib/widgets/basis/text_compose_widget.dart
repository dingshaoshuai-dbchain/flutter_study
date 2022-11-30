import 'package:flutter/cupertino.dart';

import 'container_widget.dart';

class TextComposeWidget extends StatelessWidget {
  const TextComposeWidget({
    super.key,
    this.leftWidget,
    this.rightWidget,
    this.topWidget,
    this.bottomWidget,
    required this.text,
    required this.textColor,
    required this.fontSize,
    // 文本是否展开占据最大空间
    this.textExpanded = false,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight,
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    // 一旦设置了这个，最小最大宽高都失效，按最大的来
    this.alignment,
    this.fontFamily,
    this.textAlign = TextAlign.center,
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

  final bool textExpanded;

  final Widget? leftWidget;
  final Widget? rightWidget;
  final Widget? topWidget;
  final Widget? bottomWidget;

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
    Alignment? ali = alignment;
    // 如果没有特意设置
    if (ali == null) {
      // 并且没有设置最小最大宽高，那就默认给个 center
      if (minWidth == null &&
          maxWidth == null &&
          minHeight == null &&
          maxHeight == null) {
        ali = Alignment.center;
      }
    }
    return ContainerWidget(
      width: width,
      height: height,
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
      alignment: ali,
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
      onPressed: onPressed,
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    Widget textWidget = Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily),
    );
    Widget child = textWidget;
    if (leftWidget != null || rightWidget != null) {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leftWidget != null) leftWidget!,
          // 如果设置了文本展开，就占据最大空间，防止出现溢出
          textExpanded ? Expanded(child: textWidget) : textWidget,
          if (rightWidget != null) rightWidget!,
        ],
      );
    }
    if (topWidget != null || bottomWidget != null) {
      child = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (topWidget != null) topWidget!,
          // 如果设置了文本展开，就占据最大空间，防止出现溢出
          textExpanded ? Expanded(child: child) : child,
          if (bottomWidget != null) bottomWidget!,
        ],
      );
    }
    return child;
  }
}
