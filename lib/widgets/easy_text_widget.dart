import 'package:flutter/material.dart';
import '../constant/dimes.dart';

class EasyTextWidget extends StatelessWidget {
  const EasyTextWidget({
    Key? key,
    required this.text,
    this.fontsize = kFontsize21x,
    this.fontWeight = kFontWeightDefault,
    this.color = Colors.white,
    this.decoration = TextDecoration.none,
  }) : super(key: key);
  final String text;
  final double? fontsize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: color,
          decoration: decoration),
    );
  }
}
