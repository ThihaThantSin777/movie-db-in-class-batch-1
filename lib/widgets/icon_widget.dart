import 'package:flutter/cupertino.dart';

import '../constant/colors.dart';
import '../constant/dimes.dart';

class IconWidget extends StatelessWidget {
  const IconWidget(
      {Key? key,
      required this.icon,
      this.size = kDefaultIconSize20x,
      this.color = kDefaultIconColor})
      : super(key: key);
  final IconData icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
