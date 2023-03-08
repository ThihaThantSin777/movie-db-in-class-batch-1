import 'package:flutter/material.dart';
import 'package:movie_db/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import '../data/vos/genre_vo/genre_vo.dart';
import '../data/vos/movie_vo/movie_vo/movie_vo.dart';
import '../widgets/easy_list_view_widget.dart';

class TabSection extends StatelessWidget {
  const TabSection({Key? key, required this.genreList, required this.genreByMovieList}) : super(key: key);

  final List<GenreVO> genreList;
  final List<MovieVO> genreByMovieList;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: genreList.length , child: SizedBox(
      height: dWh330x,
      child: genreList.isEmpty?const Center(child: CircularProgressIndicator(),):Column(
        children: [
          TabBarItems(genreList: genreList ,
            onTap: (index)=> context.read<HomePageBloc>().changeTab(index),
          ),
          Expanded(child: TabBarItemView(genreMovies: genreByMovieList,controller: context.read<HomePageBloc>().getScrollController2,))
        ],
      ),
    ));
  }
}



class TabBarItemView extends StatelessWidget {
  const TabBarItemView({
    Key? key,
    required this.controller, required this.genreMovies,
  }) : super(key: key);

  final ScrollController controller;
  final List<MovieVO> genreMovies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dWh200x,
      child: EasyListViewWidget(movieList: genreMovies,scrollController: controller,checked: true,),
    );
  }
}

class TabBarItems extends StatelessWidget {
  const TabBarItems({
    Key? key,
    required this.genreList,
    required this.onTap
  }) : super(key: key);

  final List<GenreVO> genreList;
  final Function (int) onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: cWhite,
      unselectedLabelColor: cGrey,
      isScrollable: true,
      indicatorColor: cAmber,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: dMp10x),
      onTap: (index)=> onTap(index),
      tabs: genreList.map((e) => Tab(text: e.name ?? "" )).toList(),
    );
  }
}
