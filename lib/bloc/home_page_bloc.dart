
import 'package:flutter/cupertino.dart';
import 'package:movie_db/data/apply/movie_db_apply_impl.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';

import '../data/vos/actor_vo/actor_vo.dart';
import '../data/vos/genre_vo/genre_vo.dart';
import '../data/vos/movie_vo/movie_vo/movie_vo.dart';

class HomePageBloc extends ChangeNotifier{
  bool isChecked = false;
  List<MovieVO> _movieList = [];
  List<MovieVO> _bestPopularMovieList = [];

  List<GenreVO> _genreList = [];
  List<MovieVO> _genreByMovieList =[];
  List<ActorVO> _knowForActorList = [];
  int genre = 28;
  final ScrollController _scrollController2 = ScrollController();
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController3 = ScrollController();
  final ScrollController _scrollController4 = ScrollController();
  int page =1 ;

  List<MovieVO> get getMovieList => _movieList;
  ScrollController get getScrollController1 => _scrollController1;
  ScrollController get getScrollController2 => _scrollController2;
  ScrollController get getScrollController3=> _scrollController3;
  ScrollController get getScrollController4=> _scrollController4;
  List<MovieVO> get getPopularMovieList => _bestPopularMovieList;
  List<GenreVO> get getGenreList => _genreList;
  List<MovieVO> get getMovieByGenreList => _genreByMovieList;
  List<ActorVO> get getActorList => _knowForActorList;


  final MovieDBApply _movieDBApply = MovieDBApplyImpl();

  HomePageBloc(){
    // banner section bloc
    _movieDBApply.getAllMoviesFromDatabaseStream(1).listen((event) {
      _movieList = event ?? [];
      notifyListeners();
    });

    // best popular movie section bloc
    _movieDBApply.getAllMoviesFromDatabaseStream(page).listen((event) {
      _bestPopularMovieList = event ?? [];
      notifyListeners();
    });

    // genre list
    _movieDBApply.getGenre().then((value) {
      _genreList = value ?? [];
      notifyListeners();
    });

    // movie by genre list
    _movieDBApply.getGenreMovie(genre, page).then((value){
      _genreByMovieList = value ?? [];
      notifyListeners();
    });

    // actor list
    _movieDBApply.getKnowForActor(page).then((value) {
      _knowForActorList = value ?? [];
        notifyListeners();
    });

    // popular scroll_controller
    _scrollController1.addListener(() {
      if(_scrollController1.position.atEdge){
        if(_scrollController1.position.pixels !=0){
          page++;
          _movieDBApply.getAllMoviesFromDatabaseStream(page).listen((event) {
            if(event?.isNotEmpty ?? false){
              var temp = event;
              temp?.forEach((element) {
                _bestPopularMovieList.add(element);
              });
              notifyListeners();
            }
          });
        }
      }
    });

    // tab scroll_controller
    _scrollController2.addListener(() {
      if (_scrollController2.position.atEdge) {
        if (_scrollController2.position.pixels != 0) {
          page++;
          _movieDBApply.getPopularMovie(page).then((value) {
            if (value?.isNotEmpty ?? false) {
              final temp = value;
              temp?.forEach((element) {
                _genreByMovieList.add(element);
              });
              notifyListeners();
            }
          });
        }
      }
    });

    // actor section controller
    _scrollController4.addListener(() {
      if (_scrollController4.position.atEdge) {
        if (_scrollController4.position.pixels != 0) {
          page++;
          _movieDBApply.getKnowForActor(page).then((value) {
            if(value?.isNotEmpty??false){
              final temp=value;
              temp?.forEach((element) {
                _knowForActorList.add(element);
              });
             notifyListeners();
            }
          });
        }
      }
    });
  }

  // tab change method
  void changeTab(index){
    genre = _genreList[index].id ?? 12;
    _movieDBApply.getGenreMovie(genre, page).then((value) {
      _genreByMovieList = value ?? [];
      notifyListeners();
    });
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    if(!isChecked){
      super.notifyListeners();
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    isChecked = true;
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    _scrollController4.dispose();
  }
}