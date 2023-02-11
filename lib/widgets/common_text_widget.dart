import 'package:flutter/material.dart';
import 'package:movie_db/constant/dimens.dart';

import '../constant/colors.dart';

class CommonTextWidget extends StatelessWidget {
  const CommonTextWidget(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight,
      this.fontSize,
      required this.needUpperCase,
      this.maxLine,
      this.txtStyle})
      : super(key: key);
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool needUpperCase;
  final int? maxLine;
  final TextDecoration? txtStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      needUpperCase ? text.toUpperCase() : text,
      maxLines: maxLine ?? 1,
      style: TextStyle(
          decoration: txtStyle ?? TextDecoration.none,
          color: color ?? kDefaultTextColor,
          fontSize: fontSize ?? kTextSize14,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
