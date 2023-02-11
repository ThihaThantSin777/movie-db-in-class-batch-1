import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_db/constant/colors.dart';
import 'package:movie_db/widgets/common_text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constant/api_constant.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/apply/movie_db_apply.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../widgets/image_widget.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    Key? key,
    required this.bestPopularMoviesList,
    required ScrollController scrollController,
  })  : _scrollController = scrollController,
        super(key: key);

  final List<MovieVO> bestPopularMoviesList;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kBoxHeight320X,
        child: (bestPopularMoviesList.isEmpty)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: kPadding10x),
                    child: CommonTextWidget(
                      text: kPopularTitle,
                      needUpperCase: true,
                      fontWeight: FontWeight.w500,
                      fontSize: kTextSize15,
                    ),
                  ),
                  kSizeBoxH10X,
                  Expanded(
                      child: BestPopularMoviesAndSerialItemView(
                          controller: _scrollController,
                          listBestPopularMovies: bestPopularMoviesList))
                ],
              ));
  }
}

class BannerImageViews extends StatelessWidget {
  const BannerImageViews({
    Key? key,
    required this.movieDBApply,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final MovieDBApply movieDBApply;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBoxHeight250X,
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
                controller: _pageController, movieList: listMovieBanner ?? []);
          }),
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
            margin: const EdgeInsets.symmetric(horizontal: kPadding10x),
            width: kBoxWidth140X,
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
        kSizeBoxH5X,
        BestPopularMoviesTitleView(title: movie.originalTitle ?? ''),
        kSizeBoxH5X,
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
        CommonTextWidget(
          text: rate.toString(),
          needUpperCase: false,
          fontSize: kTextSize12,
        ),
        RatingBar.builder(
          unratedColor: kButtonWhiteColor,
          itemSize: kRatingItemSize,
          initialRating: rate.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: kPadding4x),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: kPlayButtonColor,
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
    return CommonTextWidget(
      text: title,
      needUpperCase: false,
      fontSize: kTextSize14,
      fontWeight: FontWeight.bold,
    );
  }
}

class BestPopularMoviesImageView extends StatelessWidget {
  const BestPopularMoviesImageView({Key? key, required this.image})
      : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBoxHeight200X,
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

class BannerMovieItemView extends StatelessWidget {
  const BannerMovieItemView(
      {Key? key, required this.movieList, required this.controller})
      : super(key: key);
  final List<MovieVO> movieList;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: kBoxHeight200X,
          child: PageView.builder(
              controller: controller,
              itemCount: movieList.length,
              itemBuilder: (context, index) => BannerView(
                    title: movieList[index].originalTitle ?? '',
                    image: movieList[index].backdropPath ?? '',
                  )),
        ),
        kSizeBoxH10X,
        Center(
          child: SmoothPageIndicator(
            onDotClicked: (index) {
              controller.animateToPage(index,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            },
            controller: controller,
            count: movieList.length,
            axisDirection: Axis.horizontal,
            effect: const SlideEffect(
                spacing: kDotSpacing,
                radius: kDotRadius,
                dotWidth: kDotSize,
                dotHeight: kDotSize,
                strokeWidth: kDotStrokeW,
                dotColor: kDotColor,
                activeDotColor: kActiveDotColor),
          ),
        )
      ],
    );
  }
}

class BannerView extends StatelessWidget {
  const BannerView({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: CachedNetworkImage(
          imageUrl: (image.isEmpty) ? kDefaultImage : '$kPrefixImageLink$image',
          fit: BoxFit.cover,
          placeholder: (context, string) => const Center(
            child: CircularProgressIndicator(),
          ),
        )),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, kPrimaryColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        )),
        const Positioned.fill(
            child: Icon(
          Icons.play_circle,
          color: kPlayButtonColor,
          size: kIconSize40X,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kPadding10x,
          ),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: CommonTextWidget(
                text: title,
                needUpperCase: false,
                fontSize: kTextSize22,
                fontWeight: FontWeight.w600,
              )),
        )
      ],
    );
  }
}

class CheckLocation extends StatelessWidget {
  const CheckLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBoxHeight250X,
      child: Card(
        margin: const EdgeInsets.all(kPadding15x),
        color: kSecondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  width: kBoxWidth200X,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: kPadding20x, top: kPadding20x),
                    child: CommonTextWidget(
                      text: kCheckMTimes,
                      maxLine: 2,
                      color: kDefaultTextColor,
                      fontSize: kTextSize22,
                      needUpperCase: false,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: kPadding20x, bottom: kPadding20x),
                  child: CommonTextWidget(
                    text: kSeeMore,
                    needUpperCase: true,
                    color: kPlayButtonColor,
                    fontSize: kTextSize14,
                    txtStyle: TextDecoration.underline,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(kPadding20x),
              child: Icon(
                Icons.location_on_rounded,
                color: kButtonWhiteColor,
                size: kIconSize40X,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShowCase extends StatelessWidget {
  const ShowCase({
    Key? key,
    required this.movieDBApply,
  }) : super(key: key);

  final MovieDBApply movieDBApply;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBoxHeight250X,
      child: Column(
        children: [
          // title of the showcase
          Padding(
            padding: const EdgeInsets.only(
                left: kPadding10x, right: kPadding10x, top: kPadding10x),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CommonTextWidget(
                  text: kShowCase,
                  needUpperCase: true,
                  fontSize: kTextSize16,
                ),
                CommonTextWidget(
                  needUpperCase: true,
                  text: kMoreShowCase,
                  fontSize: kTextSize16,
                  txtStyle: TextDecoration.underline,
                )
              ],
            ),
          ),
          kSizeBoxH10X,
          // popular movies showcase
          SizedBox(
            height: kBoxWidth200X,
            child: FutureBuilder<List<MovieVO>?>(
              future: movieDBApply.getPopularMovies(1),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(kConnectionError),
                  );
                }
                final listPopular = snapshot.data;
                return ShowCaseViewIem(
                  popularMovieList: listPopular ?? [],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ShowCaseViewIem extends StatelessWidget {
  const ShowCaseViewIem({Key? key, required this.popularMovieList})
      : super(key: key);
  final List<MovieVO> popularMovieList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularMovieList.length,
        itemBuilder: (context, index) => ShowCaseItems(
              imgUrl: popularMovieList[index].backdropPath ?? "",
              title: popularMovieList[index].originalTitle ?? "",
              date: popularMovieList[index].releaseDate ?? "",
            ));
  }
}

class ShowCaseItems extends StatelessWidget {
  const ShowCaseItems(
      {Key? key, required this.imgUrl, required this.title, required this.date})
      : super(key: key);
  final String imgUrl;
  final String title;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: kPadding10x),
      child: Stack(
        children: [
          ImageWidget(
            imgUrl:
                (imgUrl.isEmpty) ? kDefaultImage : "$kPrefixImageLink$imgUrl",
            width: kBoxWidth280X,
            height: kBoxHeight200X,
          ),
          Positioned(
              bottom: kPadding10x,
              left: kPadding5x,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                    needUpperCase: false,
                    text: title,
                    fontSize: kTextSize18,
                    fontWeight: FontWeight.bold,
                  ),
                  CommonTextWidget(
                    needUpperCase: false,
                    text: date,
                    color: kSecondaryColor,
                    fontSize: kTextSize16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              )),
          const Positioned.fill(
              child: Icon(
            Icons.play_circle,
            color: kPlayButtonColor,
            size: kIconSize40X,
          ))
        ],
      ),
    );
  }
}
