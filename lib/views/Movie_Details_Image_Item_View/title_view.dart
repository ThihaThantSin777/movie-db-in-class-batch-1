import 'package:flutter/cupertino.dart';

import '../../constant/dimes.dart';
import '../../widgets/easy_text_widget.dart';

class TitleView extends StatelessWidget {
  TitleView({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return  EasyTextWidget(
          text: title,
          fontWeight: kFontWeightBold,
          fontsize: kFontsize20x,
        )
    ;
  }
}
