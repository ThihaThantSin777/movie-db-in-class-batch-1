import 'package:flutter/material.dart';
import '../../constant/Strings.dart';
import '../../constant/colors.dart';
import '../../constant/dimes.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/icon_widget.dart';

/// CheckMovieShowtimeItemView
class CheckMovieShowtimeItemView extends StatelessWidget {
  const CheckMovieShowtimeItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.all(kSP5x),
      width: kCheckMovieShowtimeItemViewWidth350x,
      height: kCheckMovieShowtimeItemViewHeight200x,
      color: kAppBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: kCheckMoviesShowtimeStringsWidth150x,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: kSP25x,
                ),
                EasyTextWidget(
                  text: kShowTimeString,
                  fontWeight: kFontWeightBold,
                  fontsize: kFontsize20x,
                ),
                SizedBox(
                  height: kSP70x,
                ),
                EasyTextWidget(
                    text: kSeeMoreString,
                    color: kPlayButtonColor,
                    fontsize: kFontsize15x,
                    decoration: TextDecoration.underline,
                    fontWeight: kFontWeightBold)
              ],
            ),
          ),
          const IconWidget(
            icon: Icons.location_on,
            color: kFontColor,
            size: kIconSize50x,
          )
        ],
      ),
    );
  }
}
