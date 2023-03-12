import 'package:flutter/cupertino.dart';

import '../constant/colors.dart';
import '../constant/dimes.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                kSecondaryColor.withOpacity(1),
                kSecondaryColor.withOpacity(0)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [kGradientStopPoint1, kGradientStopPoint2])),
    );
  }
}
