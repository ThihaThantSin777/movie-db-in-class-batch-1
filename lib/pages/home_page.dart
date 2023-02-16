import 'package:flutter/material.dart';
import 'package:movie_db/data/apply/movei_db_apply_impl.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';


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
    final MovieDBApply movieDBApply = MovieDBApplyImpl();
    return Scaffold(
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
            const BannerSection(),
            const SizedBox(height: dMp20x,),

            ///Best Popular Movies And Serial Section
            const BestPopularMovieSection(),

            //Location Section
            const LocationSection(),

            // Tab Section
            const TabSection(),
            const SizedBox(height: dMp20x,),
            ///Show Case Section
            ShowCaseSection(movieDBApply: movieDBApply),
            const SizedBox(height: dMp20x,),
            //Actor Section
            const ActorSection()
          ],
        ),
      ),
    );
  }
}


