import 'package:flutter/material.dart';
import 'package:movie_db/constant/colors.dart';

import '../constant/Strings.dart';
import '../constant/dimes.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../widgets/easy_text_widget.dart';
import 'Best_Popular_Movies_And_Serial_Item_View/best_popular_movies_and_serial_item_view.dart';


///Similar Movies Item View
class SimilarMoviesItemView extends StatelessWidget {
  const SimilarMoviesItemView({
    super.key,
    required this.similarMoviesList,
    required this.scrollController,
  }) ;

  final List<MovieVO> similarMoviesList;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kSecondaryColor,
        height: kSimilarMoviesSectionHeight420x,
        child: (similarMoviesList.isEmpty)
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kSP20x,
            ),
            const EasyTextWidget(text: kRelatedMoviesString,fontWeight: kFontWeightW300x,fontsize: kFontsize15x,),

            const SizedBox(
              height: kSP20x,
            ),
            Expanded(
                child: SimilarMoviesView(
                  controller: scrollController, listSimilarMovies: similarMoviesList ,
                ))
          ],
        ));
  }
}

///Similar MoviesView
class SimilarMoviesView extends StatefulWidget {
   const SimilarMoviesView({
    super.key,
    required this.controller,
    required this.listSimilarMovies,
  });

  final List<MovieVO> listSimilarMovies;
  final ScrollController controller;


   @override
  State<SimilarMoviesView> createState() => _SimilarMoviesViewState();
}

class _SimilarMoviesViewState extends State<SimilarMoviesView> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: kSecondaryColor,
        height: kSimilarMoviesContainerHeight400x,
        child: ListView.builder(
          controller: widget.controller,
          scrollDirection: Axis.horizontal,
          itemCount: widget.listSimilarMovies.length,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.only(right: kSP10x, left: kSP10x),
                width: kSimilarMoviesViewWidth150x,
                child: SimilarMoviesImageView(
                  movie: widget.listSimilarMovies[index],
                ));
          },
        ),
      );
  }
}

/// SimilarMoviesView
class SimilarMoviesImageView extends StatelessWidget {
  const SimilarMoviesImageView({Key? key, required this.movie})
      : super(key: key);
  final MovieVO movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
    BestPopularMoviesImageView(image: movie.backdropPath ?? ''),
    const SizedBox(
    height: kSP5x,
    ),
    BestPopularMoviesTitleView(title: movie.originalTitle ?? ''),
    const SizedBox(
    height: kSP5x,
    ),
    BestPopularMoviesRateAndRatingBarView(rate: movie.voteAverage ?? 0.0)

      ],
    );
  }
}

