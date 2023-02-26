import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../widgets/easy_text_widget.dart';

class ActorsNameAndIcon extends StatelessWidget {
  const ActorsNameAndIcon(
      {Key? key, required this.name, required this.voteCount})
      : super(key: key);

  final String name;
  final String voteCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Actors Name
          EasyTextWidget(
            text: name,
            fontSize: kActorsFontSize,
            fontWeight: kActorFontWeight,
          ),


          const SizedBox(
            height: kSP5x,
          ),

          /// Icon
          Row(
            children: [
              const Icon(
                Icons.thumb_up_alt_rounded,
                size: kLikeIconSize,
                color: kYellowColor,
              ),
              EasyTextWidget(
                text: voteCount,
                color: Colors.white60,
              )
            ],
          )
        ],
      ),
    );
  }
}
