import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constant/dimes.dart';
import 'icon_widget.dart';


class Rating extends StatelessWidget {
  const Rating({Key? key,required this.rate}) : super(key: key);
final num rate;
  @override
  Widget build(BuildContext context) {
    return  RatingBar.builder(
      itemSize: kRatingItemSize15x,
      initialRating: rate.toDouble(),
      minRating: kMinRating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: kRatingItemCount,
      itemPadding: const EdgeInsets.symmetric(horizontal: kItemPadding4x),
      itemBuilder: (context, _) => const IconWidget(icon: Icons.star),

      onRatingUpdate: (rating) {
        //print(rating);
      },
    );

  }
}
