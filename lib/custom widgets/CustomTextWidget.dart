import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool? softWrap;
  final bool? overflowVisible;
  final TextOverflow? overflow;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextHeightBehavior? textHeightBehavior;

  const CustomText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflowVisible,
    this.overflow,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textHeightBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? const TextStyle(),
      textAlign: textAlign ?? TextAlign.start,
      textDirection: textDirection,
      softWrap: softWrap ?? true,
      overflow: overflow ?? TextOverflow.clip,
      maxLines: maxLines,
      locale: locale,
      strutStyle: strutStyle,
      textHeightBehavior: textHeightBehavior,
    );
  }
}
