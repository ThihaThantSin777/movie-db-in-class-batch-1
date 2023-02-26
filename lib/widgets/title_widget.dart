import 'package:flutter/material.dart';

import '../constant/dimens.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.rightText, required this.leftText}) : super(key: key);

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            leftText,
            style: const TextStyle(
                fontSize: kLeftFontSize,
                fontWeight: kLiftFontWeight,
                color: Colors.white60),
          ),

          Text(
            rightText,
            style: const TextStyle(
                fontSize: kRightFontSize,
                fontWeight: kSeeMoreFontWeight,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}