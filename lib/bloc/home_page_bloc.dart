import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../data/apply/movie_db_apply.dart';
import '../data/apply/movie_db_apply_impl.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../data/vos/result_vo/result_vo.dart';

class HomePageBloc extends ChangeNotifier{

  /// State Instance
  final MovieDBApply movieDBApply = MovieDBApplyImpl();
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollControllerForTabBar=ScrollController();
  final ScrollController _scrollControllerForShowCase=ScrollController();
  final ScrollController _scrollControllerForActors = ScrollController();


  /// State Variable
   bool _dispose=false;
   List<MovieVO> _bestPopularMoviesList = [];
   List<MovieVO> _listMovieBanner = [];

   List<GenresVO> _generaList=[];
   List<MovieVO> _generaMovieList=[];
   List<MovieVO> _popularMoviesList=[];
   List<ResultsVO> _actorsList=[];
   int _page = 1;
   int generaID=12;


  /// Getter
  bool get isDispose=>_dispose;
  List<MovieVO> get getBestPopularMoviesList=> _bestPopularMoviesList;
  List<MovieVO> get getListMovieBanner=> _listMovieBanner;
  PageController get getPageController=> _pageController;
  ScrollController get getScrollController=> _scrollController;

  ScrollController get getScrollControllerForTabBar=> _scrollControllerForTabBar;
  List<GenresVO> get getGeneraList=> _generaList;
  List<MovieVO> get getGeneraMovieList => _generaMovieList;

  ScrollController get getScrollControllerForShowCase=> _scrollControllerForShowCase;
  List<MovieVO> get getPopularMoviesList => _popularMoviesList;

  ScrollController get getScrollControllerForActors => _scrollControllerForActors;
  List<ResultsVO> get getActorsList => _actorsList;




  int get getPage=> _page;




  @override
  void notifyListeners() {
    if(!_dispose) {
      super.notifyListeners();
    }
  }


  @override
  void dispose() {
    super.dispose();
    _dispose=true;
    _pageController.dispose();
    _scrollController.dispose();
    _scrollControllerForTabBar.dispose();
    _scrollControllerForShowCase.dispose();
    _scrollControllerForActors.dispose();
  }

  HomePageBloc(){
    movieDBApply.getAllMoviesFromDataBaseStream(1).listen((event) {
          final temp = event ?? [];
          _listMovieBanner = temp.take(5).toList();
          notifyListeners();
    });

    movieDBApply.getAllMoviesFromDataBaseStream(_page).listen((event) {

          _bestPopularMoviesList = event ?? [];
          notifyListeners();

    });

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        double pixel = _scrollController.position.pixels;
        if (pixel != 0) {
          _page++;
          movieDBApply.getNowPlayingMovies(_page).then((value) {
            if (value?.isNotEmpty ?? false) {
              final temp = value;
              temp?.forEach((element) {
                _bestPopularMoviesList.add(element);
              });
             notifyListeners();
            }
          });
        }
      }
    });
/// TabBar
    movieDBApply.getGenera().then((value) {
      //value?.map((e) => e.name);
      _generaList=value ?? [];
      notifyListeners();

    });


    movieDBApply.getMoviesByGenera(_page, generaID).then((value) {
      //value?.map((e) => e.title);
      _generaMovieList=value ?? [];
      notifyListeners();
    });

    _scrollControllerForTabBar.addListener(() {
      if (_scrollControllerForTabBar.position.atEdge) {
        double pixel = _scrollControllerForTabBar.position.pixels;
        if (pixel != 0) {
          _page++;
          movieDBApply.getMoviesByGenera(_page,generaID).then((value) {
            if (value?.isNotEmpty ?? false) {
              final temp = value;
              temp?.forEach((element) {
                _generaMovieList.add(element);
              });
              notifyListeners();
            }
          });
        }
      }
    });
/// ShowCase

    _scrollControllerForShowCase.addListener(() {
      if (_scrollControllerForShowCase.position.atEdge) {
        double pixel = _scrollControllerForShowCase.position.pixels;
        if (pixel != 0) {
          _page++;
          movieDBApply.getPopularMovies(_page).then((value) {
            if (value?.isNotEmpty ?? false) {
              final temp = value;
              temp?.forEach((element) {
                _bestPopularMoviesList.add(element);
              });
              notifyListeners();
            }
          });
        }
      }
    });

    movieDBApply.getAllPopularMoviesFromDataBaseStream(_page).listen((event) {
      _popularMoviesList =event ?? [];
      notifyListeners();
    });


    ///Actors
    movieDBApply.getAllActorsFromDatabaseStream(_page).listen((event) {
      _actorsList=event ?? [];
       notifyListeners();
    });


    _scrollControllerForActors.addListener(() {
      if (_scrollControllerForActors.position.atEdge) {
        double pixel = _scrollControllerForActors.position.pixels;
        if (pixel != 0) {
          _page++;
          movieDBApply.getActors(_page).then((value) {
            if (value?.isNotEmpty ?? false) {
              final temp = value;
              temp?.forEach((element) {
                _actorsList.add(element);
              });
              notifyListeners();
            }
          });
        }
      }
    });
  }

  void onTapMethod(int index){
  var id = _generaList[index].id;
  movieDBApply.getMoviesByGenera(_page, id ?? 1).then((value) {
    _generaMovieList = value ?? [];
    notifyListeners();
  }).catchError(
  (error) => print('error*********************$error'));
}

}