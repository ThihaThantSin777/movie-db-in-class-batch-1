import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/data/apply/movie_db_apply_impl.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import '../constant/dimens.dart';
import '../view_items/actors_view_item.dart';
import '../view_items/banner_movie_view_item.dart';
import '../view_items/location_section_view_item.dart';
import '../view_items/show_case_movie_view_item.dart';
import '../widgets/rates_and_rating_bar_widget.dart';

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
            if (value?.isNotEmpty ?? false) {
              final temp = value;
              temp?.forEach((element) {
                bestPopularMoviesList.add(element);
              });
              setState(() {});
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
      backgroundColor: Colors.black,

      appBar:  AppBar(
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
        backgroundColor: Colors.black,
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
            SizedBox(
              height: 250,
              child: FutureBuilder<List<MovieVO>?>(
                  future: movieDBApply.getNowPlayingMovies(1),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapShot.hasError) {
                      return const Center(
                        child: Text('Error Occur'),
                      );
                    }
                    final listMovieBanner = snapShot.data?.take(5).toList();
                    return BannerMovieItemView(
                        controller: _pageController,
                        movieList: listMovieBanner ?? []);
                  }),
            ),

            ///Best Popular Movies And Serial Section
            SizedBox(
                height: 300,
                child: (bestPopularMoviesList.isEmpty)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
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
                      )),

            ///Location Section
            const SizedBox(
              height: kLocationSectionHeight,
              child: LocationSectionItemView(),
            ),

            /// Genres Movies

            const SizedBox(
              height: kSP15x,
            ),

            ///Show Case Section

            FutureBuilder<List<MovieVO>?>(
                future: movieDBApply.getPopularMovies(1),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapShot.hasError) {
                    return const Center(
                      child: Text('Error Occur'),
                    );
                  }
                  final listShowCaseMovie = snapShot.data?.toList();
                  return ShowCaseMovieItemView(
                      listShowCaseMovie: listShowCaseMovie);
                }),

            /// Actors
            const SizedBox(
              height: kSP20x,
            ),

           const SizedBox(
              height: 300,
              child:  ActorsItemView(),
            ),
          ],
        ),
      ),
    );
  }
}

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
        RatesAndRatingBarWidget(rate: movie.voteAverage ?? 0.0)
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


