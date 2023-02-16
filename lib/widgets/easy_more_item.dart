import 'package:flutter/material.dart';

import '../constant/dimen.dart';
import 'easy_text_widget.dart';

class EasyMoreItem extends StatelessWidget {
  const EasyMoreItem({
    Key? key,
    this.leftText = '',
    this.rightText = ''
  }) : super(key: key);
  final String leftText;
  final String rightText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        EasyTextWidget(
          data: "  $leftText".toUpperCase(),
          fontSize: dFs14x,
        ),
        EasyTextWidget(
          data: '$rightText  '.toUpperCase(),
          fontSize: dFs14x,
          textDecoration: TextDecoration.underline,
        )
      ],
    );
  }
}