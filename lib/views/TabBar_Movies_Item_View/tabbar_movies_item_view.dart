import 'package:flutter/material.dart';
import 'package:movie_db/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';

import '../../constant/colors.dart';
import '../../constant/dimes.dart';
import '../../data/apply/movie_db_apply.dart';
import '../../data/apply/movie_db_apply_impl.dart';
import '../../data/vos/genres_vo/genres_vo.dart';
import '../../data/vos/movie_vo/movie_vo.dart';
import '../Best_Popular_Movies_And_Serial_Item_View/best_popular_movies_and_serial_item_view.dart';

/// TabBarMoviesItemView
 class TabBarMoviesItemView extends StatelessWidget {
   const TabBarMoviesItemView(
       {super.key, required this.myTabs, required this.genresMoviesList,required this.scrollController});

   final List<GenresVO> myTabs;

   final List<MovieVO> genresMoviesList;

   final ScrollController scrollController;


   @override
   Widget build(BuildContext context) {
     return Column(
       children: [
         DefaultTabController(
           length: myTabs.length,
           child: TabBar(
             isScrollable: true,
             indicatorColor: kPlayButtonColor,
             labelColor: kIconsColor,
             tabs: myTabs.map((e) => Tab(text: e.name ?? '')).toList(),
             onTap: (int index) =>context.read<HomePageBloc>().onTapMethod(index),
           ),
         ),
         Expanded(
           child: Container(
             color: kAppBarColor,
             padding: const EdgeInsets.only(top: kSP10x),
             child: TabBarMovieItemView(
               controller: scrollController,
               genreMoviesList: genresMoviesList,
             ),
           ),
         ),
       ],
     );
   }

 }









///TabBarMovieItemView
class TabBarMovieItemView extends StatelessWidget {
  const TabBarMovieItemView({
    super.key,
    required this.controller,
    required this.genreMoviesList,
  });

  final List<MovieVO> genreMoviesList;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: genreMoviesList.length,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.only(right: kSP10x, left: kSP10x),
            width: kTabBarItemViewWidth150x,
            height: kTabBarItemViewHeight250x,
          //  child:
           //
           // GestureDetector(
              // onTap: (){
              //   Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => DetailsPage(movieID: movieList[index].id ?? 0));
              //   },


              child: BestPopularMoviesView(
                movie: genreMoviesList[index],
              ),
            //)
        );
      },
    );
  }
}

