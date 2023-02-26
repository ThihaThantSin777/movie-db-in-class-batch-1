import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/pages/details_page.dart';
import '../constant/api_constant.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';

class BannerView extends StatefulWidget {
  const BannerView({
    Key? key,
    required this.image,
    required this.title,
    required this.movieID,
  }) : super(key: key);

  final String image;
  final String title;
  final int movieID;

  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailsPage
            (movieID: widget.movieID);
        }));
      },
      child: Stack(
        children: [

          /// Banner Movie Image
          Positioned.fill(
              child: CachedNetworkImage(
            imageUrl: (widget.image.isEmpty)
                ? kDefaultImage
                : '$kPrefixImageLink${widget.image}',
            fit: BoxFit.cover,
            placeholder: (context, string) => const Center(
              child: CircularProgressIndicator(),
            ),
          )),

          /// Linear gradient
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      kTransparentColor,
                      kBlackColor
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          )),

          /// Play Circle Icon
          const Positioned.fill(
              child: Icon(
            kPlayCircleIcon,
            color: kAmberColor,
            size: kPlayCircleIconSize,
          )),

          /// Banner Movie Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: kBannerTitleFontSize,
                    fontWeight: kBannerFontWeight,
                    color: kWhiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
