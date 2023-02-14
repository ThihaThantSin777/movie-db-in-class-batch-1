import 'package:flutter/material.dart';

class EasyTextWidget extends StatelessWidget {
  const EasyTextWidget({Key? key,required this.data,this.fontSize = 14.0,this.fontWeight =FontWeight.w400,this.color,this.textDecoration = TextDecoration.none}) : super(key: key);
final String data;
final double fontSize;
final Color ?color;
final FontWeight fontWeight;
final TextDecoration textDecoration;
  @override
  Widget build(BuildContext context) {
    return  Text(
      data,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.white,
        decoration: textDecoration
      ),
    );
  }
}
