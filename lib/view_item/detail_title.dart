
import 'package:flutter/material.dart';

import '../constant/dimen.dart';
import '../widgets/easy_text_widget.dart';
import '../widgets/rating_widget.dart';
import '../widgets/rounded_container.dart';

class MovieDetailTitle extends StatelessWidget {
  const MovieDetailTitle(
      {Key? key,
        required this.name,
        required this.rating,
        required this.starCount,
        required this.voteCount,
        required this.date})
      : super(key: key);
  final String name;
  final num rating;
  final double starCount;
  final String voteCount;
  final String date;
  @override
  Widget build(BuildContext context) {
    final year = date.split('-').first;
    return Positioned(
      bottom: dMp0x,
      left: dMp10x,
      right: dMp10x,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RoundedContainer(data: year),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingStarWidget(
                      itemCount: starCount,
                    ),
                    EasyTextWidget(
                      data: '$voteCount votes',
                      fontSize: dFs14x,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                EasyTextWidget(
                  data: rating.toString(),
                  fontSize: dFs40x,
                )
              ],
            ),
            const SizedBox(
              height: dMp10x,
            ),
            EasyTextWidget(
              data: name,
              fontSize: dFs25x,
            ),
            const SizedBox(
              height: dMp10x,
            ),
          ],
        ),
      ),
    );
  }
}