import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../widgets/easy_text_widget.dart';

class LocationSectionTextView extends StatelessWidget {
  const LocationSectionTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        EasyTextWidget(
          text: kShowTimeText,
          fontSize: kShowTimeFontSize,
          fontWeight: FontWeight.bold,
        ),
        EasyTextWidget(
            text: kSeeMoreText,
            color: kYellowColor,
            fontSize: kSeeMoreFontSize,
            fontWeight: kSeeMoreFontWeight)
      ],
    );
  }
}
