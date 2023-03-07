import 'package:flutter/material.dart';
import 'package:movie_db/bloc/home_page_bloc.dart';
import 'package:movie_db/constant/dimen.dart';
import 'package:provider/provider.dart';

import '../data/vos/movie_vo/movie_vo/movie_vo.dart';
import '../widgets/easy_list_view_widget.dart';
import '../widgets/easy_more_item.dart';

class BestPopularMovieSection extends StatelessWidget {
  const BestPopularMovieSection({Key? key, required this.movieList}) : super(key: key);
  final List<MovieVO> movieList ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dWh300x,
      child: BestPopularItemView(scrollController: context.read<HomePageBloc>().getScrollController1, movieList: movieList ),
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
