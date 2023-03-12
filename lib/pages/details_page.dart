import 'package:flutter/material.dart';
import 'package:movie_db/bloc/details_page_bloc.dart';
import 'package:movie_db/constant/colors.dart';
import 'package:movie_db/constant/dimes.dart';
import 'package:movie_db/utils/string_extension.dart';
import 'package:provider/provider.dart';
import '../views/Movie_Details_Image_Item_View/movie_details_image_item_view.dart';
import '../views/about_film_itemView.dart';
import '../views/movie_details_actors_tiemView.dart';
import '../views/movie_details_crews_Item_view.dart';
import '../views/over_all_view.dart';
import '../views/similar_movie_item_view.dart';
import '../views/Movie_Details_Image_Item_View/title_view.dart';
import '../views/Movie_Details_Image_Item_View/vote_average.dart';
import '../views/Movie_Details_Image_Item_View/vote_string_view.dart';
import '../views/Movie_Details_Image_Item_View/year_button_view.dart';
import '../widgets/Rating_bar_view.dart';
import '../widgets/gradient_container.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.movieID}) : super(key: key);
  final int movieID;
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(

        create: (BuildContext context) => DetailsPageBloc(movieID),
        child:
        Consumer<DetailsPageBloc>(

          builder: (BuildContext context, value, Widget? child) => Scaffold(
          backgroundColor: kSecondaryColor,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) =>[
                  SliverAppBar(
                    leading: FloatingActionButton(
                      elevation: 1,
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      backgroundColor: kTransparentColor,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    expandedHeight: kSliverAppBarExpandedHeight300x,
                    actions: const [Icon(Icons.search)],
                    backgroundColor: kTransparentColor,
                    flexibleSpace: FlexibleSpaceBar(
                      background:
                      Stack(children: [
                        SizedBox(
                          width: kWidthInfinity,
                          height: kMovieDetailsImageItemView350x,
                          child: MovieDetailsImageItemView(imageLink: value.getMovieLink),
                        ),
                        const GradientContainer(),
                        Column(
                          children: [
                              const SizedBox(
                                height: kSP160x,
                              ),
                               Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(width: kSP10x,),
                                  YearButtonView(year: value.getYear),
                                  const SizedBox(
                                    width: kSP15x,
                                  ),
                                  Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children:[
                                        Rating(rate: value.getRate,),
                                        const SizedBox(
                                          height: kSP10x,
                                        ),
                                        VotesStringView(voteCount: value.getVoteCount,),
                                      ]
                                  ),
                                  const SizedBox(
                                    width: kSP15x,
                                  ),
                                  RatingStringView(voteAverage: value.getVoteAverage,)
                                ],
                              ),
                                const SizedBox(
                                  height: kSP15x,
                                ),
                                SizedBox(
                                width: kMovieDetailsTitleViewWidth300x,
                                height: kMovieDetailsTitleViewHeight100x,
                                child: TitleView(title: value.getTitle,)),

                          ],
                        ),








                      ],),
                    ),
                  )

                ], body: SingleChildScrollView(

                          child: Column(
                            children: [
                              OverAllSectionItemView(duration: value.getTimeString.timeFormat(value.getTime), movieOverview: value.getOverView, genresList: value.getMovieType,),
                              MovieDetailsActorsItemView(castVOList: value.getCastVO ,),
                              AboutFilmItemView(originalTitle: value.getOriginalTitle, movieGenre: value.getMovieGenres?? '', movieProduction: value.getProduction ?? '', releaseDate: value.getReleaseDate, description: value.getDescription,),
                              MovieDetailsCrewsItemView(crewVOList: value.getCrewVO ,),
                              SimilarMoviesItemView(similarMoviesList: value.getSimilarMoviesList, scrollController: value.getScrollController),
                            ],
                          ),

          ),

          ),
    ),
        ),
      );
  }
}


