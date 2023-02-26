import 'package:flutter/material.dart';
import '../constant/colors.dart';

class ActorsIconView extends StatelessWidget {
  const ActorsIconView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 150, bottom: 150),
      child: Icon(
        Icons.favorite_border,
        color: kWhiteColor,
      ),
    );
  }
}
