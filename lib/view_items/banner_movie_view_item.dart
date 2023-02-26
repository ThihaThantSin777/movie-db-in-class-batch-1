import 'package:flutter/material.dart';
import 'package:movie_db/view_items/banner_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constant/dimens.dart';
import '../data/vos/movie_vo/movie_vo.dart';

class BannerMovieItemView extends StatelessWidget {
  const BannerMovieItemView({
    Key? key,
    required this.movieList,
    required this.controller,
  }) : super(key: key);
  final List<MovieVO> movieList;
  final PageController controller;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start, //

      children: [
        SizedBox(
          height: kBannerImageHeight,
          child: PageView.builder(
              controller: controller,
              itemCount: movieList.length,
              itemBuilder: (context, index) {
              int  movieID= movieList[index].id ?? 0;
              print('movie id is==========================>$movieID');

              return BannerView(
                  title: movieList[index].title ?? '',
                  image: movieList[index].backdropPath ?? '',
                  movieID: movieList[index].id ?? 0,
                );


              }),
        ),

        const SizedBox(
          height: kSP10x,
        ),

        /// Smooth Page Indicator
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
                spacing: 8.0,
                radius: 30,
                dotWidth: 15.0,
                dotHeight: 15.0,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.amber),
          ),
        )
      ],
    );
  }
}
