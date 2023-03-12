import 'package:flutter/cupertino.dart';

import '../../constant/dimes.dart';
import '../../widgets/easy_text_widget.dart';

class RatingStringView extends StatelessWidget {
  RatingStringView({Key? key, required this.voteAverage}) : super(key: key);
  double voteAverage;

  @override
  Widget build(BuildContext context) {
    return  EasyTextWidget(
          text: '$voteAverage',
          fontWeight: kFontWeightW500x,
          fontsize: kFontsize35x,
        )
    ;
  }
}
