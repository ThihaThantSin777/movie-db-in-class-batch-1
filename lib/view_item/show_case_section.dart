import 'package:flutter/material.dart';

import '../constant/api_constant.dart';
import '../constant/color.dart';
import '../constant/dimen.dart';
import '../constant/string.dart';
import '../data/apply/movie_db_apply.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../widgets/easy_cached_network_image.dart';
import '../widgets/easy_text_widget.dart';

class ShowCaseSection extends StatelessWidget {
  const ShowCaseSection({
    Key? key,
    required this.movieDBApply,
  }) : super(key: key);

  final MovieDBApply movieDBApply;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cSecondary,
      height: dWh260x,
      child: Column(
        children: [
          const SizedBox(height: dMp10x,),
          // title of the showcase
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              EasyTextWidget(
                data: "  SHOWCASE",
                fontSize: dFs16x,

              ),
              EasyTextWidget(
                data: 'MORE SHOWCASES  ',
                fontSize: dFs16x,
                textDecoration: TextDecoration.underline,
              )
            ],
          ),
          const SizedBox(
            height: dMp10x,
          ),
          // popular movies showcase
          SizedBox(
            height: dWh200x,
            child: FutureBuilder<List<MovieVO>?>(
              future: movieDBApply.getPopularMovie(1),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(sErrorMessage),
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
    );
  }
}
