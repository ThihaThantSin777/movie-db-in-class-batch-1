import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import '../widgets/easy_text_widget.dart';

class StoryLine extends StatelessWidget {
  const StoryLine({
    Key? key,
    required this.overView,
  }) : super(key: key);

  final String overView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dMp10x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EasyTextWidget(
            data: 'Story Line',
            color: cGrey,
          ),
          const SizedBox(
            height: dWh10x,
          ),
          EasyTextWidget(
            data: overView,
            fontSize: dFs14x,
          ),
          const SizedBox(
            height: dWh10x,
          ),
        ],
      ),
    );
  }
}