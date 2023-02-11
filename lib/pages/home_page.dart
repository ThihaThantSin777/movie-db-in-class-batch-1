import 'package:flutter/material.dart';
import 'package:movie_db/constant/colors.dart';
import 'package:movie_db/constant/dimens.dart';
import 'package:movie_db/constant/strings.dart';
import 'package:movie_db/data/apply/movei_db_apply_impl.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/widgets/common_text_widget.dart';

import '../view_items/home_view_items.dart';

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
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
          actions: const [
            Icon(
              Icons.search,
              size: kIconSize30X,
              color: kButtonWhiteColor,
            ),
            kSizeBoxW20X,
          ],
          leading: const Icon(
            Icons.menu,
            color: kButtonWhiteColor,
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: const CommonTextWidget(
            text: kAppBarTitle,
            needUpperCase: false,
            fontSize: kTextSize20,
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Banner Section
            BannerImageViews(
                movieDBApply: movieDBApply, pageController: _pageController),

            ///Best Popular Movies And Serial Section
            PopularMovies(
                bestPopularMoviesList: bestPopularMoviesList,
                scrollController: _scrollController),

            //Location Section
            const CheckLocation(),

            ///Show Case Section
            ShowCase(
              movieDBApply: movieDBApply,
            )
          ],
        ),
      ),
    );
  }
}
