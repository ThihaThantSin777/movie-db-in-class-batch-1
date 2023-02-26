import 'package:flutter/cupertino.dart';
import 'package:movie_db/view_items/show_case_movie_view_.dart';
import '../constant/colors.dart';
import '../constant/dimens.dart';
import '../constant/strings.dart';
import '../data/apply/movie_db_apply_impl.dart';
import '../data/apply/movie_db_apply.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../widgets/title_widget.dart';

class ShowCaseMovieItemView extends StatefulWidget {
  const ShowCaseMovieItemView({
    Key? key,
    required this.listShowCaseMovie,
  }) : super(key: key);

  final List<MovieVO> ? listShowCaseMovie;

  @override
  State<ShowCaseMovieItemView> createState() => _ShowCaseMovieItemViewState();
}

class _ShowCaseMovieItemViewState extends State<ShowCaseMovieItemView> {
  final ScrollController _scrollController = ScrollController();
  final MovieDBApply movieDBApply = MovieDBApplyImpl();
  List<MovieVO> showCaseMoviesList = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    movieDBApply.getPopularMovies(page).then((value) {
      setState(() {
        showCaseMoviesList = value ?? [];
      });
    });
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        double pixel = _scrollController.position.pixels;
        if (pixel != 0) {
          page++;
          movieDBApply.getPopularMovies(page).then((value) {
            final temp = value ?? [];
            if (temp.isNotEmpty ) {

              temp.forEach((element) {
                showCaseMoviesList.add(element);
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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kShowCaseSizedBoxHeight,
      color: kCardColor,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: TitleWidget(
              leftText: kShowCaseText,
              rightText: kMoreShowCaseText,
            ),
          ),


          const SizedBox(
            height: kSP15x,
          ),


          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: widget.listShowCaseMovie?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ShowCaseImageView(
                  movieTitle: widget.listShowCaseMovie?[index].title ?? '',
                  movieVo: widget.listShowCaseMovie?[index],
                  date: widget.listShowCaseMovie?[index].releaseDate ?? "",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
