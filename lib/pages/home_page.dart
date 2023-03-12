import 'package:flutter/material.dart';
import 'package:movie_db/bloc/home_page_bloc.dart';

import 'package:movie_db/data/apply/movie_db_apply_impl.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:provider/provider.dart';

import '../constant/Strings.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../data/vos/result_vo/result_vo.dart';
import '../views/Actors_Item_view/actors_Item_view.dart';
import '../views/Banner_Movies_Item_Views/banner_movie_item_view.dart';
import '../views/Best_Popular_Movies_And_Serial_Item_View/best_popular_movies_and_serial_item_view.dart';
import '../views/Check_Movie_ShowTimes_ItemView/check_movies_showtimes_item_view.dart';
import '../views/Show_Case_Movies_Item_View/show_case_movies_item_view.dart';
import '../views/TabBar_Movies_Item_View/tabbar_movies_item_view.dart';
import '../widgets/easy_text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // final MovieDBApply movieDBApply = MovieDBApplyImpl();
  @override
  Widget build(BuildContext context) {
    // movieDBApply.getGenera().then((value) {
    //   value?.map((e) => e.name);
    // });
    // movieDBApply.getMoviesByGenera(page, 12).then((value) {
    //   value?.map((e) => e.title);
    // });
    return ChangeNotifierProvider(
      create: (context) => HomePageBloc(),
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
            actions: const [
              Icon(
                Icons.search,
                size: kSearchIconSize,
                color: kIconsColor,
              ),
              SizedBox(
                width: kSP20x,
              ),
            ],
            leading: const Icon(
              Icons.menu,
              color: kIconsColor,
            ),
            centerTitle: true,
            backgroundColor: kAppBarColor,
            title: const EasyTextWidget(
              text: kAppBarTitle,
              fontWeight: kAppBarTitleFontWeight500x,
            )),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Banner Section
              SizedBox(
                height: kBannerSectionHeight300x,
                child: Selector<HomePageBloc, List<MovieVO>>(
                  selector: (context, bloc) => bloc.getListMovieBanner,
                  builder: (context, listMovieBanner, _) => (listMovieBanner
                          .isEmpty)
                      ? const Center(child: CircularProgressIndicator())
                      : BannerMovieItemView(
                          controller:
                              context.read<HomePageBloc>().getPageController,
                          movieList: listMovieBanner),
                ),
              ),

              ///Best Popular Movies And Serial Section
              Selector<HomePageBloc, List<MovieVO>>(
                selector: (context, bloc) => bloc.getBestPopularMoviesList,
                builder: (BuildContext context, value, Widget? child) =>
                    SizedBox(
                        height: kBestPopularMoviesSectionHeight330x,
                        child: (value.isEmpty)
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  EasyTextWidget(
                                    text: kBestPopularMoviesAndSerialString
                                        .toUpperCase(),
                                    color: kGreyColor,
                                    fontsize:
                                        kBestPopularMoviesAndSerialStringFontSize15x,
                                    fontWeight: kFontWeightW300x,
                                  ),
                                  const SizedBox(
                                    height: kSP10x,
                                  ),
                                  Expanded(
                                      child: BestPopularMoviesAndSerialItemView(
                                          controller: context
                                              .read<HomePageBloc>()
                                              .getScrollController,
                                          listBestPopularMovies: value))
                                ],
                              )),
              ),

              ///Check Movies Showtime Section
              const CheckMovieShowtimeItemView(),

              ///TabBar Section
              Consumer<HomePageBloc>(
                builder: (BuildContext context, value, Widget? child) =>
                    SizedBox(
                        height: kTabBarSectionHeight380x,
                        child: TabBarMoviesItemView(
                          myTabs: context.read<HomePageBloc>().getGeneraList,
                          genresMoviesList: context.read<HomePageBloc>().getGeneraMovieList,
                          scrollController: context.read<HomePageBloc>().getScrollControllerForTabBar,
                        )),
              ),

              ///Show Case Section
              Selector<HomePageBloc, List<MovieVO>>(
                selector: (context, bloc) => bloc.getPopularMoviesList,
                builder: (BuildContext context, value, Widget? child) =>
                    SizedBox(
                  height: kShowcaseMoviesSectionHeight350x,
                  child: ShowCasesMoviesItemView(
                    popularMoviesList:
                        context.read<HomePageBloc>().getPopularMoviesList,
                    scrollController: context.read<HomePageBloc>().getScrollControllerForShowCase,
                  ),
                ),
              ),

              ///Actors Section
              Selector<HomePageBloc,List<ResultsVO>>(

                selector: (context ,bloc )  => bloc.getActorsList,

                builder: (BuildContext context, value, Widget? child) => Container(
                  color: kAppBarColor,
                  height: kActorsSectionHeight300x,
                  child:  ActorsImageItemView(actorsList: value, scrollController: context.read<HomePageBloc>().getScrollControllerForActors,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
