
import 'package:flutter/material.dart';
import 'package:movie_db/utils/navigate_screen.dart';
import 'package:movie_db/widgets/rating_widget.dart';

import '../constant/api_constant.dart';
import '../constant/color.dart';
import '../constant/dimen.dart';
import '../data/vos/movie_vo/movie_vo/movie_vo.dart';
import '../pages/detail_page.dart';
import 'easy_cached_network_image.dart';
import 'easy_text_widget.dart';

class EasyListViewWidget extends StatelessWidget {
  const EasyListViewWidget(
      {Key? key, required this.movieList, this.checked = false, required this.scrollController})
      : super(key: key);
  final List<MovieVO> movieList;
  final bool checked;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return (movieList.isEmpty)?const Center(child: CircularProgressIndicator()):ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) => (checked == false)
            ? FirstStyle(
                imgUrl: movieList[index].backdropPath ?? "",
                title: movieList[index].originalTitle ?? "",
                date: movieList[index].releaseDate ?? "",
                movieId: movieList[index].id?? 0,
              )
            : SecondStyle(
                imgUrl: movieList[index].backdropPath ?? "",
                title: movieList[index].originalTitle ?? "",
                itemCount: movieList[index].voteAverage ?? 0.0,
                movieId: movieList[index].id?? 0,
              ));
  }
}

class FirstStyle extends StatelessWidget {
  const FirstStyle(
      {Key? key, required this.imgUrl, required this.title, required this.date, required this.movieId})
      : super(key: key);
  final String imgUrl;
  final String title;
  final String date;
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        navigateToNextScreen(context,DetailPage(movieId: movieId,))
      },
      child: Container(
        margin: const EdgeInsets.only(left: dMp10x),
        child: Stack(
          children: [
            EasyCachedImage(
              imgUrl:
                  (imgUrl.isEmpty) ? kDefaultImage : "$kPrefixImageLink$imgUrl",
              width: dWh270x,
              height: dWh200x,
            ),
            Positioned(
                bottom: dMp10x,
                left: dMp5x,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EasyTextWidget(
                      data: title,
                      fontSize: dFs16x,
                    ),
                    EasyTextWidget(
                      data: date,
                      color: cPrimary,
                      fontSize: dFs16x,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                )),
            const Positioned.fill(
                child: Icon(
              Icons.play_circle,
              color: cAmber,
              size: dFs40x,
            ))
          ],
        ),
      ),
    );
  }
}

class SecondStyle extends StatelessWidget {
  const SecondStyle({Key? key, required this.imgUrl, required this.title, required this.itemCount, required this.movieId,})
      : super(key: key);
  final String imgUrl;
  final num itemCount;
  final String title;
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        navigateToNextScreen(context,DetailPage(movieId: movieId,))
      },
      child: Container(
        padding: const EdgeInsets.only(left: dMp10x),
        width: dWh170x,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EasyCachedImage(
              imgUrl:
                  (imgUrl.isEmpty) ? kDefaultImage : "$kPrefixImageLink$imgUrl",width: dWh140x,height: dWh180x,
            ),
            Expanded(
              child: EasyTextWidget(
                data: title,
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  EasyTextWidget(data: itemCount.toString()),
                  RatingStarWidget(itemCount: itemCount.toDouble())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


