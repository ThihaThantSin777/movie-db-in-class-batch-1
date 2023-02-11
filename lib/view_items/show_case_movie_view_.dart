import 'package:flutter/material.dart';
import 'package:movie_db/constant/colors.dart';
import '../constant/api_constant.dart';
import '../constant/dimens.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../widgets/cached_network_image_widget.dart';
import '../widgets/easy_text_widget.dart';

class ShowCaseImageView extends StatelessWidget {
  const ShowCaseImageView({
    Key? key,
    required this.movieTitle,
    this.movieVo,
    required this.date,
  }) : super(key: key);
  final String movieTitle;
  final MovieVO? movieVo;
  final String date;

  @override
  Widget build(BuildContext context) {
    var image = movieVo?.backdropPath ?? '';

    return Container(
      margin:const EdgeInsets.only(left: 20),
      width: 260,
      child: Stack(
        children: [
          /// Image
          CachedNetworkImageWidget(
            imageUrl: ('$kPrefixImageLink$image'),
            height: 220,
          ),

          /// Icon
          const Align(
              alignment: Alignment.center,
              child: Icon(
                kPlayCircleIcon,
                color: kYellowColor,
                size: kPlayCircleIconSize,
              )),

          /// Show Case Movie Text
          Padding(
            padding: const EdgeInsets.only(top: 165,left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EasyTextWidget(
                  text: movieTitle,
                ),
                const SizedBox(
                  height: kSP5x,
                ),
                EasyTextWidget(text: date)
              ],
            ),
          )
        ],
      ),
    );
  }
}
