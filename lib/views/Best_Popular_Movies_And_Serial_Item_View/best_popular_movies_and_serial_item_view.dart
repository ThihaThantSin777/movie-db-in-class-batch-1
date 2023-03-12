import 'package:flutter/material.dart';

import '../../constant/dimes.dart';
import '../../data/vos/movie_vo/movie_vo.dart';
import '../../pages/details_page.dart';
import '../../widgets/Rating_bar_view.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/image_from_network.dart';

/// BestPopularMoviesAndSerialItemView
class BestPopularMoviesAndSerialItemView extends StatelessWidget {
  const BestPopularMoviesAndSerialItemView({
    super.key,
    required this.controller,
    required this.listBestPopularMovies,
  });

  final List<MovieVO> listBestPopularMovies;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: listBestPopularMovies.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.only(right: kSP10x, left: kSP10x),
            width: kBestPopularMoviesAndSerialItemViewWidth140x,
            child: BestPopularMoviesView(
              movie: listBestPopularMovies[index],
            ));
      },
    );
  }
}

/// BestPopularMoviesView
class BestPopularMoviesView extends StatelessWidget {
  const BestPopularMoviesView({Key? key, required this.movie})
      : super(key: key);
  final MovieVO movie;

  @override
  Widget build(BuildContext context) {
    int id = movie.id ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(movieID: id)));
            },
            child: BestPopularMoviesImageView(image: movie.backdropPath ?? '')),
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

/// BestPopularMoviesImageView
class BestPopularMoviesImageView extends StatelessWidget {
  const BestPopularMoviesImageView({Key? key, required this.image})
      : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kBestPopularMoviesImageViewHeight200x,
        child: ImageFromNetwork(
          image: image,
        ));
  }
}

/// BestPopularMoviesTitleView
class BestPopularMoviesTitleView extends StatelessWidget {
  const BestPopularMoviesTitleView({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return EasyTextWidget(
      text: title,
      fontsize: kFontsize14x,
      fontWeight: kFontWeightBold,
    );
  }
}

/// BestPopularMoviesRateAndRatingBarView
class BestPopularMoviesRateAndRatingBarView extends StatelessWidget {
  const BestPopularMoviesRateAndRatingBarView({Key? key, required this.rate})
      : super(key: key);
  final num rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EasyTextWidget(text:rate.toString(),
          fontsize: kRatingFontSize12x,
          fontWeight: kFontWeightBold,
        ),

        Rating(rate: rate,)
      ],
    );
  }
}
