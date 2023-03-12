import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/constant/colors.dart';

import '../../constant/dimes.dart';
import '../../widgets/easy_text_widget.dart';

class YearButtonView extends StatelessWidget {
  const YearButtonView({
    Key? key,
    required this.year,
  }) : super(key: key);
  final String year;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kYearButtonWidth80x,
      height: kYearButtonHeight40x,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: kPlayButtonColor,
          borderRadius: BorderRadius.circular(kButtonBorderRadius40x)),
      child: EasyTextWidget(
          text: year,
          fontsize: kFontSize18x,
          fontWeight: kFontWeightBold,
        ),

    );
  }
}
