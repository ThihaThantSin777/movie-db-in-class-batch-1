import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import 'location_section_text_view.dart';

class LocationSectionItemView extends StatelessWidget {
  const LocationSectionItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kCardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [

          /// Location Section Text
          LocationSectionTextView(),

          /// Location Icon
          Padding(
            padding:  EdgeInsets.only(right: 20),
            child: Icon(
              kLocationIcon,
              color: kWhiteColor,
              size: kLocationIconSize,
            ),
          ),
        ],
      ),
    );
  }
}
