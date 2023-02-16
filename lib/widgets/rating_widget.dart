import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';

class RatingStarWidget extends StatelessWidget {
  const RatingStarWidget({
    Key? key,
    required this.itemCount,
  }) : super(key: key);

  final double itemCount;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: itemCount/2,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: dFs20x,
      unratedColor: cGrey,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: cAmber,
      ),
      onRatingUpdate: (rating) {
      },
    );
  }
}