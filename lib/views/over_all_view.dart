import 'package:flutter/material.dart';
import 'package:movie_db/data/vos/genres_vo/genres_vo.dart';

import '../constant/Strings.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../widgets/chip_widget.dart';
import '../widgets/easy_text_widget.dart';

class OverAllSectionItemView extends StatelessWidget {
  const OverAllSectionItemView({
    Key? key,
    required this.duration,
    required this.genresList,
    required this.movieOverview,
  }) : super(key: key);
  final String duration;
  final List<GenresVO> genresList;

  final String movieOverview;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      width: kWidthInfinity,
      height: kOverAllSectionItemViewHeight450x,
      padding: const EdgeInsets.all(kSP10x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: kSP10x,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.access_time,
                    color: kPlayButtonColor,
                  ),
                  label: EasyTextWidget(
                    text: duration,
                    fontWeight: kFontWeightBold,
                    fontsize: kFontsize14x,
                  )),
              // Wrap(
              //   spacing: kSP10x,
              //   children: genresList
              //       .map((e) => ChipsWidget(text: e.name ?? ''))
              //       .toList(),
              // ),
              ...List.generate(genresList.length+1, (index) {
                if(index<genresList.length){
                  return ChipsWidget(text: genresList[index].name ?? '');
                }
                return const Icon(
                  Icons.favorite_border,
                  color: kFontColor,
                );
              }),

            ],
          ),
          const SizedBox(
            height: kSP10x,
          ),
          const EasyTextWidget(
            text: kStorylinesString,
            color: kGreyColor,
            fontsize: kFontsize15x,
          ),
          const SizedBox(
            height: kSP10x,
          ),
          EasyTextWidget(
            text: movieOverview,
            fontWeight: kFontWeightBold,
            fontsize: kFontsize14x,
          ),
          const SizedBox(
            height: kSP20x,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(
                        kElevatedButtonWidth160x, kElevatedButtonHeight50x),
                    backgroundColor: kPlayButtonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            kElevatedButtonBorderRadius50x))),
                icon: const Icon(
                  Icons.play_circle_outlined,
                  size: kPlayCircleOutlinedIconSize15x,
                ),
                label: const EasyTextWidget(
                  text: kPLAYTRAILERString,
                  fontWeight: kFontWeightBold,
                  fontsize: kFontsize15x,
                ),
              ),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.star,
                  color: kPlayButtonColor,
                ),
                label: const EasyTextWidget(
                  text: kRATEMOVIEString,
                  fontWeight: kFontWeightBold,
                  fontsize: kFontsize15x,
                ),
                style: OutlinedButton.styleFrom(
                    fixedSize: const Size(
                        kElevatedButtonWidth160x, kElevatedButtonHeight50x),
                    side: const BorderSide(
                        width: kOutlinedButtonBorderSide2x, color: kFontColor),
                    shadowColor: kFontColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(kButtonBorderRadius40x))),
              )
            ],
          )
        ],
      ),
    );
  }
}
