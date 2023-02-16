import 'package:flutter/material.dart';
import 'package:movie_db/constant/dimen.dart';

import '../data/apply/movei_db_apply_impl.dart';
import '../data/apply/movie_db_apply.dart';
import '../data/vos/movie_vo/movie_vo/movie_vo.dart';
import '../widgets/easy_list_view_widget.dart';
import '../widgets/easy_more_item.dart';

class BestPopularMovieSection extends StatefulWidget {
  const BestPopularMovieSection({Key? key}) : super(key: key);

  @override
  State<BestPopularMovieSection> createState() => _BestPopularMovieSectionState();
}

class _BestPopularMovieSectionState extends State<BestPopularMovieSection> {
  final MovieDBApply _movieApply = MovieDBApplyImpl();
  final ScrollController _scrollController = ScrollController();
  List<MovieVO>? movieList ;
  int page = 1;
  @override
  void initState() {
    super.initState();
    _movieApply.getPopularMovie(page).then((value) {
      setState(() {
        movieList = value;
      });
    });
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        double pixel = _scrollController.position.pixels;
        if (pixel != 0) {
          page++;
          _movieApply.getPopularMovie(page).then((value) {
            if(value?.isNotEmpty??false){
              final temp=value;
              temp?.forEach((element) {
                movieList?.add(element);
              });
              setState(() {
              });
            }
          });
        }
      }
    }
    );
  }
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dWh300x,
      child: BestPopularItemView(scrollController: _scrollController, movieList: movieList ?? []),
    );
  }
}

class BestPopularItemView extends StatelessWidget {
  const BestPopularItemView({
    Key? key,
    required ScrollController scrollController,
    required this.movieList,
  }) : _scrollController = scrollController, super(key: key);

  final ScrollController _scrollController;
  final List<MovieVO> movieList;

  @override
  Widget build(BuildContext context) {
    return movieList.isEmpty?const Center(child: CircularProgressIndicator(),):Column(
      children:  [
        // title of the best popular movie and serial
        const EasyMoreItem(leftText: 'Best popular movies and serial',),
        const SizedBox(height: dMp10x,),
        Expanded(
          child: EasyListViewWidget(
            scrollController: _scrollController,
            movieList: movieList,
            checked: true,
          ),
        )
      ],
    );
  }
}
