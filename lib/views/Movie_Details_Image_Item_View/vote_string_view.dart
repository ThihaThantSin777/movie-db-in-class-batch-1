import 'package:flutter/material.dart';
import 'package:movie_db/utils/string_extension.dart';
import 'package:movie_db/widgets/easy_text_widget.dart';

import '../../constant/colors.dart';
import '../../constant/dimes.dart';

class VotesStringView extends StatelessWidget {
  VotesStringView({Key? key, required this.voteCount}) : super(key: key);
  int voteCount;

  @override
  Widget build(BuildContext context) {
    return
         EasyTextWidget(
          text: '${voteCount}vote'.addS(voteCount),
          color: kSmoothPageIndicatorGreyColor,
          fontsize: kFontsize15x,
        )
    ;
  }
}
