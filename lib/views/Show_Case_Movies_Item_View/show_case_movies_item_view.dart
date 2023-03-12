import 'package:flutter/material.dart';
import '../../constant/Strings.dart';
import '../../constant/colors.dart';
import '../../constant/dimes.dart';
import '../../data/apply/movie_db_apply_impl.dart';
import '../../data/apply/movie_db_apply.dart';
import '../../data/vos/movie_vo/movie_vo.dart';
import '../../pages/details_page.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/image_from_network.dart';

///ShowCaseItemView
class ShowCasesMoviesItemView extends StatelessWidget {
   ShowCasesMoviesItemView({
    super.key,required this.popularMoviesList,required this.scrollController
  });

  ScrollController scrollController ;

  List<MovieVO> popularMoviesList ;

  @override
  Widget build(BuildContext context) {

    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: kSP30x,
          ),
          Row(
            children: const [
              EasyTextWidget(
                  text: kShowcaseString,
                  fontsize: kFontsize15x,
                  fontWeight: kFontWeightW300x,
                  color: kFontColor),
              Spacer(),
              EasyTextWidget(
                  text: kShowCaseMoreString,
                  fontsize: kFontsize15x,
                  fontWeight: kFontWeightBold,
                  decoration: TextDecoration.underline)
            ],
          ),
          const SizedBox(
            height: kSP20x,
          ),

          ShowCasesMoviesView(movieList: popularMoviesList ?? [], controller: scrollController,),

        ],
      );



  }
}

/// ShowCaseMoviesView
class ShowCasesMoviesView extends StatelessWidget {
  const ShowCasesMoviesView(
      {super.key,required this.movieList,required this.controller
      });

  final List<MovieVO> movieList;
  final ScrollController controller;



  @override
  Widget build(BuildContext context) {
    return  (movieList.isEmpty)
        ? const Center(
      child: CircularProgressIndicator(),
    )
        :Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: kBannerPageViewHeight250x,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: movieList.length,
            itemBuilder: (context, index) =>
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsPage(movieID: movieList[index].id ?? 0)));
                  },
                  child: SizedBox(
                      height: kShowcaseMoviesBoxHeight250x,
                      child: Container(
                        margin: const EdgeInsets.only(left: kSP10x),
                        width: kShowcaseMoviesImagesWidth300x,
                        height: kShowcaseMoviesImagesHeight250x,
                        child: Stack(children: [
                          SizedBox(
                            width: kShowcaseMoviesImagesWidth300x,
                            height: kShowcaseMoviesImagesHeight250x,
                            child: ImageFromNetwork(image: movieList[index].backdropPath ?? '',),
                          ),
                          Positioned(
                            left: kSP5x,
                            bottom: kSP20x,
                            child: Column(
                              children: [
                                EasyTextWidget(
                                  text: movieList[index].title ?? '',
                                  fontWeight: kFontWeightBold,
                                  fontsize: kFontsize15x,
                                ),
                                EasyTextWidget(
                                  text: movieList[index].releaseDate ?? '',
                                  color: kGreyColor,
                                  fontWeight: kFontWeightBold,
                                  fontsize: kFontsize15x,
                                ),
                              ],
                            ),
                          ),
                          const Center(
                              child: Icon(
                                Icons.play_circle,
                                size: kIconSize50x,
                                color: kPlayButtonColor,
                              )),
                        ]),
                      )),
                ), separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: kSP15x,),

          ),
        ),
      ],
    );

  }
}
