import 'package:flutter/material.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import '../data/apply/movei_db_apply_impl.dart';
import '../data/vos/genre_vo/genre_vo.dart';
import '../data/vos/movie_vo/movie_vo/movie_vo.dart';
import '../widgets/easy_list_view_widget.dart';

class TabSection extends StatefulWidget {
  const TabSection({Key? key}) : super(key: key);

  @override
  State<TabSection> createState() => _TabSectionState();
}

class _TabSectionState extends State<TabSection> {
  final MovieDBApply movieApply = MovieDBApplyImpl();
  ScrollController controller = ScrollController();
  List<GenreVO> genreList = [];
  List<MovieVO> genreByMovieList =[];
  int genre = 28;
  int page = 1;
  @override
  void initState() {
    super.initState();
    movieApply.getGenre().then((value) {
      setState(() {
        genreList = value ?? [];
      });
    });
    movieApply.getGenreMovie(genre, page).then((value){
      setState(() {
        genreByMovieList = value ?? [];
      });
    });
    controller.addListener(() {
      if (controller.position.atEdge) {
        double pixel = controller.position.pixels;
        if (pixel != 0) {
          page++;
          movieApply.getPopularMovie(page).then((value) {
            if(value?.isNotEmpty??false){
              final temp=value;
              temp?.forEach((element) {
                genreByMovieList.add(element);
              });
              setState(() {
              });
            }
          });
        }
      }
    }
    );}
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: genreList.length , child: SizedBox(
      height: dWh330x,
      child: genreList.isEmpty?const Center(child: CircularProgressIndicator(),):Column(
        children: [
          TabBarItems(genreList: genreList ,
            onTap: (index){
              genre = genreList[index].id ?? 1;
              movieApply.getGenreMovie(genre, page).then((value) {
                setState(() {
                  genreByMovieList = value ?? [];
                });
              });
            },
          ),
          Expanded(child: TabBarItemView(genreMovies: genreByMovieList,controller: controller,))
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
      tabs: genreList.map((e) => Tab(text: e.name ?? "" ,
    )).toList(),);
  }
}
