import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constant/Strings.dart';
import '../../constant/colors.dart';
import '../../constant/dimes.dart';
import '../../data/vos/movie_vo/movie_vo.dart';
import '../../pages/details_page.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/image_from_network.dart';

/// BannerMovieItemView
class BannerMovieItemView extends StatelessWidget {
  const BannerMovieItemView(
      {Key? key, required this.movieList, required this.controller})
      : super(key: key);
  final List<MovieVO> movieList;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return movieList.isEmpty
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: kBannerPageViewHeight250x,
          child: PageView.builder(
              controller: controller,
              itemCount: movieList.length,
              itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap:(){Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsPage(movieID: movieList[index].id ?? 0)));
                    },

                    child: BannerView(
                title: movieList[index].originalTitle ?? '',
                image: movieList[index].backdropPath ?? '',
              ),
                  )),
        ),
        const SizedBox(
          height: kSP10x,
        ),
        Center(
          child: SmoothPageIndicator(
            onDotClicked: (index) {
              controller.animateToPage(index,
                  duration: const Duration(seconds: kSmoothPageIndicatorDurationSecond),
                  curve: Curves.easeIn);
            },
            controller: controller,
            count: movieList.length,
            axisDirection: Axis.horizontal,
            effect: const SlideEffect(
                spacing: kSmoothPageIndicatorSpacing10x,
                radius: kSmoothPageIndicatorRadius13x,
                dotWidth: kSmoothPageIndicatorDotWidth8x,
                dotHeight: kSmoothPageIndicatorDotHeight8x,
                strokeWidth: kSmoothPageIndicatorStokeWidth1_5x,
                dotColor: kSmoothPageIndicatorGreyColor,
                activeDotColor: kSmoothPageIndicatorActiveDotAmberColor),
          ),
        )
      ],
    );
  }
}

/// BannerView
class BannerView extends StatelessWidget {
   BannerView({
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
            child:
            ImageFromNetwork(image: image,)

        ),
        const Positioned.fill(
            child: GradientContainer()
        ),
        Padding(
            padding: const EdgeInsets.only(top: kSP140x, left: kSP10x),
            child: EasyTextWidget(
              text: title,
              fontWeight: kFontWeightW500x,
            )),
        const Padding(
          padding: EdgeInsets.only(top: kSP200x, left: kSP10x),
          child: EasyTextWidget(
            text: kOfficialReviewString,
            fontWeight: kFontWeightW400x,
          ),
        ),
        const Positioned.fill(
            child: Icon(
              Icons.play_circle,
              color: kPlayButtonColor,
              size: kPlayCircleIconSize40x,
            )),
      ],
    );
  }
}
