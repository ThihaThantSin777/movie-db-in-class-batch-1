import 'package:flutter/material.dart';

import '../constant/color.dart';

class GradientContainerWidget extends StatelessWidget {
  const GradientContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Container(
          decoration:  const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, cPrimary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ));
  }
}