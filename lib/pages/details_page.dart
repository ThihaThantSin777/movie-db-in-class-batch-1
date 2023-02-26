import 'package:flutter/material.dart';
import 'package:movie_db/constant/api_constant.dart';
import '../data/apply/movie_db_apply.dart';
import '../data/apply/movie_db_apply_impl.dart';
import '../data/vos/details_vo/details_vo.dart';
import '../view_items/silver_app_bar_view.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.movieID}) : super(key: key);

  final int movieID;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final MovieDBApply movieDBApply = MovieDBApplyImpl();
  final ScrollController _scrollController = ScrollController();
  DetailsVO? movieDetails;

  void iniState() {
    super.initState();
    movieDBApply.getDetails(widget.movieID).then((value) {
      movieDetails = value;
    });
    print ('data===================> $movieDetails');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String image = movieDetails?.title ?? '';
    print('image url is==============================> $image');

    return MaterialApp(
      home: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
              /// Silver Appbar
          SilverAppBarView(
            title: movieDetails?.title ?? '',
            voteCount: movieDetails?.voteCount.toString() ?? '',
            releaseDate: movieDetails?.releaseDate ?? '',
            silverAppBarImage: '$kPrefixImageLink$image',
            voteAverage: movieDetails?.voteAverage ?? 0,
          )

        ],
        body: Container(),
      )),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:movie_db/constant/api_constant.dart';
// import 'package:movie_db/constant/colors.dart';
// import 'package:movie_db/constant/dimens.dart';
// import 'package:movie_db/data/apply/movie_db_apply.dart';
// import 'package:movie_db/data/vos/cast_and_crews_vo/crew_vo/crew_vo.dart';
// import 'package:movie_db/data/vos/details_vo/production_vo/production_vo.dart';
// import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
// import '../data/apply/movie_db_apply_impl.dart';
// import '../data/vos/cast_and_crews_vo/cast_vo/cast_vo.dart';
// import '../data/vos/details_vo/details_vo.dart';
// import '../data/vos/details_vo/genre_vo/genre_vo.dart';
// import '../view_items/silver_app_bar_view.dart';
// import '../widgets/cached_network_image_widget.dart';
// import '../widgets/easy_text_widget.dart';
// import '../widgets/title_widget.dart';
//
//
// class DetailsPage extends StatefulWidget {
//   const DetailsPage({
//     Key? key,
//     required this.movieID,
//   }) : super(key: key);
//
//   final int movieID;
//
//   @override
//   State<DetailsPage> createState() => _DetailsPageState();
// }
//
//
// class _DetailsPageState extends State<DetailsPage> {
//   // final String movieImage;
//   MovieDBApply movieDBApply = MovieDBApplyImpl();
//   DetailsVO? detailsMovie;
//   List<CastVO>? castMovie = [];
//
//   @override
//   void initState() {
//     super.initState();
//     movieDBApply.getDetails(widget.movieID).then((value) {
//       setState(() {
//         detailsMovie = value;
//       });
//     });
//
//     // movieDBApply.getCast(widget.movieID).then((value) {
//     //   setState(() {
//     //     castMovie = value ?? [];
//     //   });
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int runTime = detailsMovie?.runtime ?? 0;
//     List<GenreVO> genresType = detailsMovie?.genres ?? [];
//     List<ProductionVO> production = detailsMovie?.productionCompanies ?? [];
//
//     double runTimeHour = runTime / 60;
//     double runTimeMin = runTime % 60;
//
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             backgroundColor: Colors.black,
//             body: NestedScrollView(
//               floatHeaderSlivers: true,
//               headerSliverBuilder:
//                   (BuildContext context, bool innerBoxIsScrolled) => [
//                 ///Silver AppBar
//                 SilverAppBarView(
//                   detailsMovie: detailsMovie,
//                 ),
//               ], body: Container(height: 100,width: 100,color: Colors.yellowAccent,),
//               // body: ListView(
//               //   children: [
//               //     /// Runtime,Genre type and Icon
//               //     Wrap(
//               //       children: [
//               //         Padding(
//               //           padding: const EdgeInsets.only(left: 10, top: 11),
//               //           child: Row(
//               //             mainAxisSize: MainAxisSize.min,
//               //             mainAxisAlignment: MainAxisAlignment.spaceAround,
//               //             children: [
//               //               const Icon(
//               //                 Icons.schedule_outlined,
//               //                 color: kYellowColor,
//               //               ),
//               //               OutLinedButtonText(text: '$runTimeHour$runTimeMin'),
//               //             ],
//               //           ),
//               //         ),
//               //
//               //         const SizedBox(
//               //           width: kSP5x,
//               //         ),
//               //
//               //         OutlinedButtonWidget(
//               //           text: genresType[0].name ?? '',
//               //         ),
//               //
//               //         const SizedBox(
//               //           width: kSP5x,
//               //         ),
//               //
//               //         /// genre type
//               //         OutlinedButtonWidget(
//               //           text: genresType[1].name ?? '',
//               //         ),
//               //         const SizedBox(
//               //           width: kSP5x,
//               //         ),
//               //
//               //         OutlinedButtonWidget(
//               //           text: genresType[2].name ?? '',
//               //         ),
//               //         const SizedBox(
//               //           width: kSP5x,
//               //         ),
//               //
//               //         const Padding(
//               //           padding: EdgeInsets.symmetric(horizontal: 10),
//               //           child: Icon(
//               //             Icons.favorite_border,
//               //             color: kWhiteColor,
//               //           ),
//               //         )
//               //       ],
//               //     ),
//               //
//               //     const SizedBox(
//               //       height: 10,
//               //     ),
//               //
//               //     /// Story Lines
//               //     Padding(
//               //       padding: const EdgeInsets.symmetric(horizontal: 12),
//               //       child: Column(
//               //         mainAxisSize: MainAxisSize.min,
//               //         crossAxisAlignment: CrossAxisAlignment.start,
//               //         children: [
//               //           const EasyTextWidget(
//               //             text: "StoryLines",
//               //             fontSize: 18,
//               //             color: Colors.white24,
//               //           ),
//               //
//               //           const SizedBox(
//               //             height: 8,
//               //           ),
//               //
//               //           EasyTextWidget(
//               //             text: detailsMovie?.overview ?? '',
//               //             fontSize: 18,
//               //           ),
//               //
//               //           const SizedBox(
//               //             height: 10,
//               //           ),
//               //
//               //           /// Play Trailer and Rate Movie
//               //           Row(
//               //             children: [
//               //               /// Play Trailer
//               //               ElevatedButton.icon(
//               //                   onPressed: () {},
//               //                   style: ElevatedButton.styleFrom(
//               //                       fixedSize: const Size(175, 40),
//               //                       backgroundColor: kYellowColor,
//               //                       shape: RoundedRectangleBorder(
//               //                           borderRadius:
//               //                               BorderRadius.circular(20))),
//               //                   icon: const Icon(kPlayCircleIcon),
//               //                   label: const EasyTextWidget(
//               //                     text: "PlAY TRAILER",
//               //                     fontSize: 15,
//               //                     fontWeight: FontWeight.w400,
//               //                   )),
//               //
//               //               const SizedBox(
//               //                 width: 10,
//               //               ),
//               //
//               //               /// Rate Movies
//               //
//               //               TextButton.icon(
//               //                 onPressed: () {},
//               //                 style: TextButton.styleFrom(
//               //                     shape: RoundedRectangleBorder(
//               //                         borderRadius: BorderRadius.circular(20),
//               //                         side: const BorderSide(
//               //                             width: 2, color: kWhiteColor))),
//               //                 icon: const Icon(
//               //                   kStarIcon,
//               //                   color: kYellowColor,
//               //                 ),
//               //                 label: const EasyTextWidget(
//               //                   text: 'RATE MOVIE',
//               //                   fontSize: 15,
//               //                   fontWeight: FontWeight.w400,
//               //                 ),
//               //               )
//               //             ],
//               //           )
//               //         ],
//               //       ),
//               //     ),
//               //
//               //     const SizedBox(
//               //       height: 30,
//               //     ),
//               //
//               //     /// cast image
//               //     ActorScrollImage(),
//               //
//               //     /// About film
//               //
//               //     Column(
//               //       crossAxisAlignment: CrossAxisAlignment.start,
//               //       children: [
//               //         const Padding(
//               //           padding: EdgeInsets.only(left: 15, top: 25),
//               //           child: EasyTextWidget(
//               //             text: 'About Film',
//               //             color: Colors.white60,
//               //           ),
//               //         ),
//               //         Row(
//               //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //           crossAxisAlignment: CrossAxisAlignment.start,
//               //           children: [
//               //             Padding(
//               //               padding: const EdgeInsets.only(left: 15, top: 15),
//               //               child: SizedBox(
//               //                 height: kLeftTextHeight,
//               //                 width: kLeftTextWidth,
//               //                 child: Column(
//               //                   mainAxisAlignment:
//               //                       MainAxisAlignment.spaceBetween,
//               //                   crossAxisAlignment: CrossAxisAlignment.start,
//               //                   children: const [
//               //                     EasyTextWidget(
//               //                       text: "Original Title",
//               //                       color: Colors.white60,
//               //                     ),
//               //                     EasyTextWidget(
//               //                       text: "Type",
//               //                       color: Colors.white60,
//               //                     ),
//               //                     EasyTextWidget(
//               //                       text: "Production",
//               //                       color: Colors.white60,
//               //                     ),
//               //                     EasyTextWidget(
//               //                       text: "Premiere",
//               //                       color: Colors.white60,
//               //                     ),
//               //                     EasyTextWidget(
//               //                       text: "Description",
//               //                       color: Colors.white60,
//               //                     ),
//               //                   ],
//               //                 ),
//               //               ),
//               //             ),
//               //             Padding(
//               //               padding: const EdgeInsets.only(left: 15, top: 15),
//               //               child: SizedBox(
//               //                 width: kRightTextWidth,
//               //                 height: kRightTextHeight,
//               //                 child: Column(
//               //                   mainAxisAlignment:
//               //                       MainAxisAlignment.spaceBetween,
//               //                   crossAxisAlignment: CrossAxisAlignment.start,
//               //                   children: [
//               //                     EasyTextWidget(
//               //                       text: production[2].name ?? '',
//               //                       fontWeight: kRightTextFontWeight,
//               //                     ),
//               //                     const EasyTextWidget(
//               //                       text: "Science Fiction,Adventure,Action",
//               //                       fontWeight: kRightTextFontWeight,
//               //                     ),
//               //                     const EasyTextWidget(
//               //                       text: "South Korea",
//               //                       fontWeight: kRightTextFontWeight,
//               //                     ),
//               //                     EasyTextWidget(
//               //                       text: detailsMovie?.releaseDate ?? '',
//               //                       fontWeight: kRightTextFontWeight,
//               //                     ),
//               //                     EasyTextWidget(
//               //                       text: detailsMovie?.overview ?? '',
//               //                       fontWeight: kRightTextFontWeight,
//               //                     ),
//               //                   ],
//               //                 ),
//               //               ),
//               //             )
//               //           ],
//               //         ),
//               //       ],
//               //     ),
//               //
//               //     const SizedBox(
//               //       height: kSP20x,
//               //     ),
//               //
//               //     /// title widget and actor scroll
//               //
//               //     ActressScrollImage(),
//               //
//               //     const EasyTextWidget(
//               //       text: "   Related Movies",
//               //       fontSize: 20,
//               //       fontWeight: FontWeight.w500,
//               //     ),
//               //
//               //     const SizedBox(
//               //       height: 20,
//               //     ),
//               //
//               //     /// Related Movies
//               //     const SizedBox(
//               //         width: double.infinity,
//               //         height: 250,
//               //         child: RelatedMovieView())
//               //   ],
//               // ),
//             )));
//   }
// }
//
// ///
// class OutLinedButtonText extends StatelessWidget {
//   const OutLinedButtonText(
//       {Key? key, required this.text, this.color = Colors.white})
//       : super(key: key);
//   final Color color;
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(color: color),
//     );
//   }
// }
//
// /// movie type
//
// class OutlinedButtonWidget extends StatelessWidget {
//   const OutlinedButtonWidget({Key? key, required this.text}) : super(key: key);
//
//   final String text;
//
//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         backgroundColor: Colors.white12,
//         elevation: 1,
//       ),
//       onPressed: () {},
//       child: OutLinedButtonText(
//         text: text,
//       ),
//     );
//   }
// }
//
// /// Second ImaGE
//
// class ActorScrollImage extends StatefulWidget {
//   ActorScrollImage({
//     Key? key,
//   }) : super(key: key);
//
//   late int movieID;
//
//   @override
//   State<ActorScrollImage> createState() => _ActorScrollImageState();
// }
//
// class _ActorScrollImageState extends State<ActorScrollImage> {
//   MovieDBApply movieDBApply = MovieDBApplyImpl();
//   final ScrollController _scrollController = ScrollController();
//   List<CastVO>? castMovie = [];
//   late int movieID;
//
//   @override
//   void initState() {
//     super.initState();
//
//     movieDBApply.getCast(widget.movieID).then((value) {
//       setState(() {
//         castMovie = value ?? [];
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 300,
//           color: kCardColor,
//           child: SizedBox(
//             height: 200,
//             child: ListView.builder(
//               controller: _scrollController,
//               scrollDirection: Axis.horizontal,
//               itemCount: castMovie?.length,
//               itemBuilder: (BuildContext context, int index) {
//                 String image = castMovie?[index].profilePath ?? '';
//                 int movieID = castMovie?[index].id ?? 0;
//
//
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           height: 200,
//                           width: 180,
//                           margin: const EdgeInsets.only(left: 15),
//                           child: CachedNetworkImageWidget(
//                               imageUrl: '$kPrefixImageLink$image'),
//                         ),
//
//                         /// favourite Icon
//
//                         const Padding(
//                           padding: EdgeInsets.only(left: 150, bottom: 150),
//                           child: Icon(
//                             Icons.favorite_border,
//                             color: kWhiteColor,
//                           ),
//                         ),
//
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15, top: 120),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               EasyTextWidget(
//                                 text: castMovie?[index].name ?? '',
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Row(
//                                 children: const [
//                                   Icon(
//                                     Icons.thumb_up_alt_rounded,
//                                     size: 18,
//                                     color: kYellowColor,
//                                   ),
//                                   EasyTextWidget(
//                                     text: 'you liked 3 movies',
//                                     color: Colors.white60,
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//         const Padding(
//           padding: EdgeInsets.only(
//             left: 15,
//             top: 12,
//           ),
//           child: EasyTextWidget(
//             text: "ACTORS",
//             fontSize: 17,
//             color: Colors.white60,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// /// Actors Scroll Image
//
// class ActressScrollImage extends StatefulWidget {
//   ActressScrollImage({
//     Key? key,
//   }) : super(key: key);
//
//   late int movieID;
//
//   @override
//   State<ActressScrollImage> createState() => _ActressScrollImageState();
// }
//
// class _ActressScrollImageState extends State<ActressScrollImage> {
//   @override
//   Widget build(BuildContext context) {
//     final ScrollController scrollController = ScrollController();
//     List<CrewVO>? crewMovie = [];
//
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 300,
//           color: kCardColor,
//           child: SizedBox(
//             height: 300,
//             child: ListView.builder(
//               controller: scrollController,
//               scrollDirection: Axis.horizontal,
//               itemCount: crewMovie.length,
//               itemBuilder: (BuildContext context, int index) {
//
//                 String image = crewMovie[index].profilePath ?? '';
//                 int movieID = crewMovie[index].id ?? 0;
//
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           height: 200,
//                           width: 180,
//                           margin: const EdgeInsets.only(left: 15),
//                           child: CachedNetworkImageWidget(
//                               imageUrl: '$kPrefixImageLink$image'),
//                         ),
//
//                         /// favourite Icon
//
//                         const Padding(
//                           padding: EdgeInsets.only(left: 150, bottom: 150),
//                           child: Icon(
//                             Icons.favorite_border,
//                             color: kWhiteColor,
//                           ),
//                         ),
//
//                         Padding(
//                           padding: const EdgeInsets.only(left: 15, top: 120),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               EasyTextWidget(
//                                 text: crewMovie[index].originalName ?? '',
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               Row(
//                                 children: const [
//                                   Icon(
//                                     Icons.thumb_up_alt_rounded,
//                                     size: 18,
//                                     color: kYellowColor,
//                                   ),
//                                   EasyTextWidget(
//                                     text: 'you like 4 movies',
//                                     color: Colors.white60,
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//         const Padding(
//           padding: EdgeInsets.only(top: 15, left: 15, right: 15),
//           child: TitleWidget(
//             rightText: 'MORE CREATORS',
//             leftText: 'CREATORS',
//           ),
//         )
//       ],
//     );
//   }
// }
//
// /// Related Movies View
//
// class RelatedMovieView extends StatefulWidget {
//   const RelatedMovieView({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<RelatedMovieView> createState() => _RelatedMovieViewState();
// }
//
// class _RelatedMovieViewState extends State<RelatedMovieView> {
//   final MovieDBApply movieDBApply = MovieDBApplyImpl();
//   final ScrollController _scrollController = ScrollController();
//
//   List<MovieVO> similarMovieList = [];
//   int page = 1;
//
//   @override
//   void initState() {
//     super.initState();
//     movieDBApply.getSimilarMovie(page).then((value) {
//       setState(() {
//         similarMovieList = value ?? [];
//       });
//     });
//     _scrollController.addListener(() {
//       if (_scrollController.position.atEdge) {
//         double pixel = _scrollController.position.pixels;
//         if (pixel != 0) {
//           page++;
//           movieDBApply.getSimilarMovie(page).then((value) {
//             if (value?.isNotEmpty ?? false) {
//               final temp = value;
//               temp?.forEach((element) {
//                 similarMovieList.add(element);
//               });
//               setState(() {});
//             }
//           });
//         }
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (BuildContext context, int index) =>
//           const SizedBox(width: kSP15x),
//       scrollDirection: Axis.horizontal,
//       itemCount: similarMovieList.length,
//       itemBuilder: (BuildContext context, int index) {
//         String image = similarMovieList[index].backdropPath ?? '';
//
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// Light Year Image
//             Container(
//               height: 180,
//               width: 125,
//               margin: const EdgeInsets.only(left: 15),
//               child: CachedNetworkImageWidget(
//                 imageUrl: '$kPrefixImageLink$image',
//               ),
//             ),
//
//             ///  Tab Bar Text and Rating Bar
//             Padding(
//               padding: const EdgeInsets.only(left: 15, top: 8),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const EasyTextWidget(
//                     text: 'Related Movies',
//                     fontWeight: FontWeight.w500,
//                     fontSize: 20,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//
//                   /// Rating and Rating Bar
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       EasyTextWidget(
//                         text: similarMovieList[index].voteAverage.toString(),
//                       ),
//                       RatingBar.builder(
//                         wrapAlignment: WrapAlignment.spaceBetween,
//                         initialRating: 4.2,
//                         minRating: 1,
//                         direction: Axis.horizontal,
//                         allowHalfRating: true,
//                         itemCount: 5,
//                         itemSize: 15,
//                         itemPadding:
//                             const EdgeInsets.symmetric(horizontal: 0.2),
//                         itemBuilder: (context, _) => const Icon(
//                           Icons.star,
//                           color: Colors.amber,
//                         ),
//                         onRatingUpdate: (rating) {},
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
