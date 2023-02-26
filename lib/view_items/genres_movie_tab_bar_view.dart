import 'package:flutter/material.dart';
import 'package:movie_db/constant/colors.dart';

class GenresMoviesTabBarView extends StatelessWidget {
  const GenresMoviesTabBarView({Key? key,
    required this.genresName,
    required this.onTap,
   })
      : super(key: key);

  final List<String> genresName;
  final Function(int) onTap;


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length:genresName.length,
        child: TabBar(
            onTap: (index) => onTap(index),
            indicatorColor: kYellowColor,
            isScrollable: true,
            tabs:genresName.map((movieType) => Tab(
              text: movieType,)).toList()));
  }
}
