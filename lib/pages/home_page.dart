import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/data/apply/movei_db_apply_impl.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';


import '../constant/color.dart';
import '../constant/dimen.dart';
import '../view_item/banner_section.dart';
import '../view_item/location_section.dart';
import '../view_item/show_case_section.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieDBApply movieDBApply = MovieDBApplyImpl();
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  List<MovieVO> bestPopularMoviesList = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    movieDBApply.getNowPlayingMovies(page).then((value) {
      setState(() {
        bestPopularMoviesList = value ?? [];
      });
    });
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        double pixel = _scrollController.position.pixels;
        if (pixel != 0) {
          page++;
          movieDBApply.getNowPlayingMovies(page).then((value) {
            if(value?.isNotEmpty??false){
              final temp=value;
              temp?.forEach((element) {
                bestPopularMoviesList.add(element);
              });
              setState(() {

              });
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
        ],
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: cSecondary,
        title: const Text(
          'Discover',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Banner Section
            const BannerSection(),
            const SizedBox(height: dMp20x,),

            ///Best Popular Movies And Serial Section
            SizedBox(
                height: 300,
                child: (bestPopularMoviesList.isEmpty)?const Center(child: CircularProgressIndicator(),): Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '  Best Popular Movies And Serial'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: BestPopularMoviesAndSerialItemView(
                            controller: _scrollController,
                            listBestPopularMovies: bestPopularMoviesList))
                  ],
                )
            ),

            //Location Section
            const LocationSection(),

            ///Show Case Section
            ShowCaseSection(movieDBApply: movieDBApply)

          ],
        ),
      ),
    );
  }
}



class BestPopularMoviesAndSerialItemView extends StatelessWidget {
  const BestPopularMoviesAndSerialItemView({
    Key? key,
    required this.controller,
    required this.listBestPopularMovies,
  }) : super(key: key);

  final List<MovieVO> listBestPopularMovies;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: listBestPopularMovies?.length ?? 0,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            width: 140,
            child: BestPopularMoviesView(
              movie: listBestPopularMovies[index],
            ));
      },
    );
  }
}

class BestPopularMoviesView extends StatelessWidget {
  const BestPopularMoviesView({Key? key, required this.movie})
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
          height: 5,
        ),
        BestPopularMoviesTitleView(title: movie.originalTitle ?? ''),
        const SizedBox(
          height: 5,
        ),
        BestPopularMoviesRateAndRatingBarView(rate: movie.voteAverage ?? 0.0)
      ],
    );
  }
}

class BestPopularMoviesRateAndRatingBarView extends StatelessWidget {
  const BestPopularMoviesRateAndRatingBarView({Key? key, required this.rate})
      : super(key: key);
  final num rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rate.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        RatingBar.builder(
          itemSize: 15,
          initialRating: rate.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            //print(rating);
          },
        )
      ],
    );
  }
}

class BestPopularMoviesTitleView extends StatelessWidget {
  const BestPopularMoviesTitleView({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold));
  }
}

class BestPopularMoviesImageView extends StatelessWidget {
  const BestPopularMoviesImageView({Key? key, required this.image})
      : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CachedNetworkImage(
        imageUrl: (image.isEmpty) ? kDefaultImage : '$kPrefixImageLink$image',
        fit: BoxFit.cover,
        placeholder: (context, string) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}


