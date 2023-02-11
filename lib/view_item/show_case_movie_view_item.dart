import 'package:flutter/cupertino.dart';
import 'package:movie_db/view_item/show_case_movie_view_.dart';

import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../widgets/tilte_widget.dart';

class ShowCaseMovieItemView extends StatelessWidget {
  const ShowCaseMovieItemView({
    Key? key,
    required this.listShowCaseMovie,
  }) : super(key: key);

  final List<MovieVO>? listShowCaseMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kShowCaseSizedBoxHeight,
      color: kCardColor,
      child: Column(
        children: [
          const  Padding(
            padding:   EdgeInsets.only(top: 20),
            child: TitleWidget(
              leftText: kShowCaseText,
              rightText: kMoreShowCaseText,
            ),
          ),

          const SizedBox(
            height: kSP15x,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listShowCaseMovie?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return  ShowCaseImageView(
                  movieTitle: listShowCaseMovie?[index].title ?? '' ,
                  movieVo: listShowCaseMovie?[index],
                  date: listShowCaseMovie?[index].releaseDate ?? "",

                );
              },
            ),
          ),
        ],
      ),
    );
  }
}