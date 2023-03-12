import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/Strings.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../widgets/easy_text_widget.dart';

class AboutFilmItemView extends StatelessWidget {
   AboutFilmItemView({Key? key,required this.originalTitle,required this.movieGenre,required this.movieProduction,required this.releaseDate,required this.description}) : super(key: key);
  String originalTitle;
  String movieGenre;
 String movieProduction;
 String releaseDate;
 String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kAboutFilmItemViewHeight650x,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: kSP20x,),
          const EasyTextWidget(
          text: kAboutFilmString,
          fontsize: kFontsize15x,
fontWeight: kFontWeightW300x,
color: kWhite70,
          ),
          SizedBox(
            width: kAboutFilmColumnWidth350x,
            height: kAboutFilmColumnHeight580x,
            child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: kSP20x,),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                    const EasyTextWidget(
                      text: kOriginalTitleString ,
                      fontsize: kFontsize15x,
                      fontWeight: kFontWeightW300x,
                      color: kWhite54,
                    ),
                      const SizedBox(
                        width: kSp18x,
                      ),
                  SizedBox(
                    width: kDescriptionContainerWidth220x,
                    child: EasyTextWidget(
                        text: originalTitle,
                        fontsize: kFontsize15x,
                        fontWeight: kFontWeightBold,
                      ),
                  ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    const EasyTextWidget(
                      text: kTypeString,
                      fontsize: kFontsize15x,
                      fontWeight: kFontWeightW300x,
                      color: kWhite54,
                    ),
                      const SizedBox(
                        width: kSP73x,
                      ),
                  SizedBox(
                    width: kDescriptionContainerWidth220x,
                    child: EasyTextWidget(
                        text: movieGenre,
                        fontsize: kFontsize15x,
                        fontWeight: kFontWeightBold,
                      ),
                  ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const EasyTextWidget(
                        text: kProductionString,
                        fontsize: kFontsize15x,
                        fontWeight: kFontWeightW300x,
                        color: kWhite54,
                      ),

                      const SizedBox(
                        width: kSP30x,
                      ),
                  SizedBox(
                    width: kDescriptionContainerWidth220x,
                    child: EasyTextWidget(
                        text: movieProduction,
                        fontsize: kFontsize15x,
                        fontWeight: kFontWeightBold,
                      ),
                  ),
                    ],
                  ),
                ),

                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const EasyTextWidget(
                        text: kPremiereString,
                        fontsize: kFontsize15x,
                        fontWeight: kFontWeightW300x,
                        color: kWhite54,
                      ),

                      const SizedBox(
                        width: kSP45x,
                      ),
                      EasyTextWidget(
                        text: releaseDate,
                        fontsize: kFontsize15x,
                        fontWeight: kFontWeightBold,
                      ),

                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const EasyTextWidget(
                        text: kDescriptionString,
                        fontsize: kFontsize15x,
                        fontWeight: kFontWeightW300x,
                        color: kWhite54,
                      ),

                      const SizedBox(
                        width: kSP30x,
                      ),
                      SizedBox(
                        width: kDescriptionContainerWidth220x,
                          child:  EasyTextWidget(
                            text: description,
                            fontsize: kFontsize15x,
                            fontWeight: kFontWeightBold,
                          ),

                          //Text(widget.description)
                        ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],

      ),
    ) ;

  }
}
