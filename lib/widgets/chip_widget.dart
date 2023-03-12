import 'package:flutter/material.dart';

import '../constant/colors.dart';

class ChipsWidget extends StatelessWidget {
  const ChipsWidget({Key? key,required this.text,this.backgroundColor=kAppBarColor, this.labelColor= Colors.white,}) : super(key: key);
  final String text;
  final Color? backgroundColor;
  final Color? labelColor;
  @override
  Widget build(BuildContext context) {
    return Chip(label:
    Text(text),backgroundColor: backgroundColor,labelStyle: TextStyle(color: labelColor),);
  }
}