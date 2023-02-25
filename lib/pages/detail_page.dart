
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/credit_vo/crew_vo.dart';
import 'package:movie_db/utils/string_extension.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import '../data/apply/movei_db_apply_impl.dart';
import '../data/vos/credit_vo/cast_vo.dart';
import '../data/vos/detail_vos/production_country_vo.dart';
import '../data/vos/genre_vo/genre_vo.dart';
import '../data/vos/movie_vo/movie_vo/movie_vo.dart';
import '../network/response/detail_response/detail_response.dart';
import '../view_item/about_flim_section.dart';
import '../widgets/easy_actor_widget.dart';
import '../widgets/easy_button_widget.dart';
import '../widgets/easy_cached_network_image.dart';
import '../widgets/easy_list_view_widget.dart';
import '../widgets/easy_more_item.dart';
import '../widgets/easy_text_widget.dart';
import '../widgets/rating_widget.dart';
import '../widgets/rounded_container.dart';

class DetailPage extends StatefulWidget {
  final int movieId;
  const DetailPage({Key? key, required this.movieId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ScrollController _controller = ScrollController();
  final ScrollController _controller1 = ScrollController();
  final MovieDBApply _movieDBApply = MovieDBApplyImpl();
  DetailResponse? movieDetails;
  List<CastVO>? getCast;
  List<CrewVO>? getCrew;
  List<MovieVO>? getSimilarMovie;
  int page = 1;
  @override
  void initState() {
    super.initState();
    _movieDBApply.getDetails(widget.movieId).then((value) {
      setState(() {
        movieDetails = value;
      });
    });

    _movieDBApply.getCast(widget.movieId).then((value) {
      setState(() {
        getCast = value;
      });
    });
    _movieDBApply.getCrew(widget.movieId).then((value) {
      setState(() {
        getCrew = value;
      });
    });
    _movieDBApply
        .getSimilarMovie(page, widget.movieId)
        .then((value) => getSimilarMovie = value);
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        final pixel = _controller.position.pixels;
        if (pixel != 0) {
          page++;
          _movieDBApply.getSimilarMovie(page, widget.movieId).then((value) {
            if (value?.isNotEmpty ?? false) {
              final temp = value;
              temp?.forEach((element) {
                getSimilarMovie?.add(element);
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
    super.dispose();
    _controller.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBarItem(
            imgUrl: movieDetails?.backdropPath ?? '',
            name: movieDetails?.originalTitle ?? "",
            rating: movieDetails?.voteAverage ?? 1,
            voteCount: movieDetails?.voteCount ?? 1,
            date: movieDetails?.releaseDate ?? '',
          )
        ],
        body: DetailBody(
          date: movieDetails?.releaseDate ?? "",
          time: movieDetails?.runtime ?? 60,
          listGenre: movieDetails?.genres ?? [],
          overView: movieDetails?.overview ?? "",
          name: movieDetails?.originalTitle ?? "",
          country: movieDetails?.productionCountries ?? [],
          controller: _controller,
          cast: getCast ?? [],
          crew: getCrew ?? [],
          similarMovie: getSimilarMovie ?? [], controller1: _controller1,
          runtime: movieDetails?.runtime?? 1,
        ),
      ),
    );
  }
}

class SliverAppBarItem extends StatelessWidget {
  const SliverAppBarItem({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.rating,
    required this.voteCount,
    required this.date,
  }) : super(key: key);
  final String imgUrl;
  final String name;
  final num rating;
  final int voteCount;
  final String date;

  @override
  Widget build(BuildContext context) {
    num starCount = rating;
    return SliverAppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Padding(
          padding: EdgeInsets.only(left: dMp10x),
          child: CircleAvatar(
            radius: dR30x,
            backgroundColor: cSecondaryShadow,
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
      actions: const [
        Icon(
          Icons.search,
          color: cWhite,
          size: dFs35x,
        ),
        SizedBox(
          width: dMp20x,
        )
      ],
      backgroundColor: cPrimary,
      expandedHeight: dWh280x,
      flexibleSpace: FlexibleSpaceBar(
        background: imgUrl.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(children: [
                EasyCachedImage(
                    imgUrl: imgUrl.isEmpty
                        ? kDefaultImage
                        : '$kPrefixImageLink$imgUrl',
                    width: double.infinity,
                    height: dWh320x),
                Container(
                    width: double.infinity,
                    height: dWh320x,
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            cSecondaryShadow,
                            Colors.transparent,
                            cPrimary
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0, 0, 1]),
                    )),
                MovieDetailTitle(
                  name: name,
                  rating: rating,
                  starCount: starCount.toDouble(),
                  voteCount: voteCount.toString(),
                  date: date,
                ),
              ]),
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
    required this.time,
    required this.listGenre,
    required this.overView,
    required this.name,
    required this.country,
    required this.date,
    required this.controller,
    required this.cast,
    required this.crew,
    required this.similarMovie, required this.controller1, required this.runtime,
  }) : super(key: key);
  final int time;
  final List<GenreVO> listGenre;
  final String overView;
  final int runtime;
  final String name;
  final String date;
  final List<ProductionCountries> country;
  final ScrollController controller;
  final ScrollController controller1;
  final List<CastVO> cast;
  final List<CrewVO> crew;
  final List<MovieVO> similarMovie;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Category
            Wrap(
              spacing: dMp5x,
              runSpacing: dMp5x,
              children: [
                const Icon(
                  Icons.access_time,
                  color: cAmberShadow,
                ),
                EasyTextWidget(data: ''.getTimeString(runtime)),
                Wrap(
                  spacing: dMp5x,
                  runSpacing: dMp5x,
                  children: List.generate(
                    listGenre.length,
                    (index) => RoundedContainer(
                      data: '${listGenre[index].name}',
                      checked: true,
                    ),
                  ),
                ),
                const Icon(
                  CupertinoIcons.heart,
                  size: dFs25x,
                  color: cWhite,
                ),
              ],
            ),
            const SizedBox(
              height: dWh10x,
            ),
            //story line
            StoryLine(overView: overView),

            // Play and Rate Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: dMp10x),
              child: Row(
                children: const [
                  EasyButtonWidgets(
                    data: 'PLAY TRAILER',
                    icon: Icons.play_circle_outline_outlined,
                    checked: true,
                  ),
                  SizedBox(
                    width: dMp5x,
                  ),
                  EasyButtonWidgets(
                    icon: Icons.star,
                    data: 'RATE MOVIE',
                  )
                ],
              ),
            ),

            // Cast Section
            CastSection(cast: cast, controller: controller1),
            // About Flim
            const SizedBox(
              height: dMp20x,
            ),
            AboutFilmSection(
              name: name,
              date: date.toString(),
              country: ''.getCountry(country),
              description: overView,
              generic: ''.getComma(listGenre),
            ),

            // Crew Section
            CrewSection(crew: crew, controller: controller1),

            // Related Section
            const SizedBox(
              height: dMp20x,
            ),
            const EasyMoreItem(
              leftText: 'Related Movies',
            ),
            const SizedBox(
              height: dMp20x,
            ),
            (similarMovie.isEmpty)?const Center(child: CircularProgressIndicator()):SizedBox(
                height: dWh280x,
                child: EasyListViewWidget(
                  scrollController: controller,
                  movieList: similarMovie,
                  checked: true,
                ))
          ],
        ),
      ],
    );
  }
}

class StoryLine extends StatelessWidget {
  const StoryLine({
    Key? key,
    required this.overView,
  }) : super(key: key);

  final String overView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dMp10x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EasyTextWidget(
            data: 'Story Line',
            color: cGrey,
          ),
          const SizedBox(
            height: dWh10x,
          ),
          EasyTextWidget(
            data: overView,
            fontSize: dFs14x,
          ),
          const SizedBox(
            height: dWh10x,
          ),
        ],
      ),
    );
  }
}

class CastSection extends StatelessWidget {
  const CastSection({
    Key? key,
    required this.cast,
    required this.controller,
  }) : super(key: key);

  final List<CastVO> cast;
  final ScrollController controller;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: dWh280x,
      color: cSecondary,
      child: Column(
        children: [
          const SizedBox(
            height: dMp10x,
          ),
          const EasyMoreItem(
            leftText: 'Actors',
          ),
          const SizedBox(
            height: dMp10x,
          ),
          (cast.isEmpty)
              ? const Center(child: CircularProgressIndicator())
              : EasyActorWidget(controller: controller, knowForActor: cast),
        ],
      ),
    );
  }
}

class CrewSection extends StatelessWidget {
  const CrewSection({
    Key? key,
    required this.crew,
    required this.controller,
  }) : super(key: key);

  final List<CrewVO> crew;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dWh280x,
      color: cSecondary,
      child: Column(
        children: [
          const SizedBox(
            height: dMp10x,
          ),
          const EasyMoreItem(
            leftText: 'Creators',
            rightText: 'More Creators',
          ),
          const SizedBox(
            height: dMp10x,
          ),
          (crew.isEmpty)
              ? const Center(child: CircularProgressIndicator())
              : EasyActorWidget(controller: controller, knowForActor: crew),
        ],
      ),
    );
  }
}

class MovieDetailTitle extends StatelessWidget {
  const MovieDetailTitle(
      {Key? key,
      required this.name,
      required this.rating,
      required this.starCount,
      required this.voteCount,
      required this.date})
      : super(key: key);
  final String name;
  final num rating;
  final double starCount;
  final String voteCount;
  final String date;
  @override
  Widget build(BuildContext context) {
    final year = date.split('-').first;
    return Positioned(
      bottom: dMp0x,
      left: dMp10x,
      right: dMp10x,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RoundedContainer(data: year),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RatingStarWidget(
                      itemCount: starCount,
                    ),
                    EasyTextWidget(
                      data: '$voteCount votes',
                      fontSize: dFs14x,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                EasyTextWidget(
                  data: rating.toString(),
                  fontSize: dFs40x,
                )
              ],
            ),
            const SizedBox(
              height: dMp10x,
            ),
            EasyTextWidget(
              data: name,
              fontSize: dFs25x,
            ),
            const SizedBox(
              height: dMp10x,
            ),
          ],
        ),
      ),
    );
  }
}
