import 'package:flutter/material.dart';
import 'package:movie_db/bloc/home_page_bloc.dart';
import 'package:movie_db/data/vos/actor_vo/actor_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo/movie_vo.dart';
import 'package:provider/provider.dart';


import '../constant/color.dart';
import '../constant/dimen.dart';
import '../view_item/actor_section.dart';
import '../view_item/banner_section.dart';
import '../view_item/best_popular_movie_section.dart';
import '../view_item/location_section.dart';
import '../view_item/show_case_section.dart';
import '../view_item/tab_section.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
      create: (context)=> HomePageBloc(),
      child: Scaffold(
        backgroundColor: cPrimary,
        appBar: AppBar(
          actions: const [
            Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
          ],
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          centerTitle: true,
          backgroundColor: cSecondary,
          title: const Text(
            'Discover',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Banner Section
              Selector<HomePageBloc,List<MovieVO>>(
                selector: (context,selector)=> selector.getMovieList,
                  builder: (context,movieList,child)=>BannerSection(moviesList: movieList,)),
              const SizedBox(height: dMp20x,),

              ///Best Popular Movies And Serial Section
              Selector<HomePageBloc,List<MovieVO>>(
                  selector: (context,selector)=> selector.getPopularMovieList,
                   builder: (context,movieList,child)=>BestPopularMovieSection(movieList: movieList,)),

              const SizedBox(height: dMp10x,),
              //Location Section
              const LocationSection(),
              // Tab Section
              Consumer<HomePageBloc>(
                builder: (context,bloc,child)=> TabSection(genreList: bloc.getGenreList, genreByMovieList: bloc.getMovieByGenreList,),),

              const SizedBox(height: dMp20x,),

              ///Show Case Section
              Selector<HomePageBloc,List<MovieVO>>(
                  selector: (context,selector)=> selector.getMovieList,
                  builder: (context,movieList,child)=>ShowCaseSection(listPopular: movieList,),),
              const SizedBox(height: dMp20x,),

              //Actor Section
              Selector<HomePageBloc,List<ActorVO>>(
                selector: (context,selector)=> selector.getActorList,
                builder: (context,actorList,child)=>ActorSection(knowForActor: actorList,),),
            ],
          ),
        ),
      ),
    );
  }
}


