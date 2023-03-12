import 'package:flutter/cupertino.dart';

import '../data/apply/movie_db_apply.dart';
import '../data/apply/movie_db_apply_impl.dart';
import '../data/vos/credits_vo/cast_vo/cast_vo.dart';
import '../data/vos/credits_vo/crew_vo/crew_vo.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../network/response/movie_details_response/movie_details_response.dart';

class DetailsPageBloc extends ChangeNotifier {
  /// State Variable
  bool _dispose = false;
  MovieDetailsResponse? _movieDetails;
  List<CastVO?> _movieCast = [];
  List<CrewVO> _movieCrew = [];
  List<MovieVO> _similarMoviesList = [];
  int _page = 1;

  String _movieLink='';
  String _date='';
  String _title='';
  int _voteCount=0;
  double _voteAverage=0.0;
  String _year='';
  num _time=0;
  String _timeString='';
  List<GenresVO> _movieType=[];
  String _overView='';
  String _originalTitle='';
  List<String?>? _genreList=[];
  String? _movieGenres='';
  String? _production='';
  String _releaseDate='';
  String _description='';
  num _rate=0.0;

  /// State Instance
  final MovieDBApply movieDBApply = MovieDBApplyImpl();
  final ScrollController _scrollController = ScrollController();

  ///Getter

  bool get isDispose => _dispose;

  MovieDetailsResponse? get getMovieDetailsResponse => _movieDetails;

  List<CastVO?> get getCastVO => _movieCast;

  List<CrewVO?> get getCrewVO => _movieCrew;

  List<MovieVO> get getSimilarMoviesList => _similarMoviesList;

  int get getPage => _page;

  ScrollController get getScrollController => _scrollController;

   String  get getMovieLink => _movieLink;
  String get getDate => _date ;
  String get getTitle => _title;
  int get getVoteCount => _voteCount;
  double get getVoteAverage => _voteAverage;
  String get getYear => _year;
  num get getTime =>_time;
  String get getTimeString=> _timeString;
  List<GenresVO> get getMovieType => _movieType;
  String get getOverView => _overView;
  String get getOriginalTitle => _originalTitle;
  List<String?>? get getGenresList=> _genreList;
  String? get getMovieGenres=> _movieGenres;
  String? get getProduction=> _production;
  String get getReleaseDate=> _releaseDate;
  String get getDescription =>_description;
  num get getRate => _rate;






  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }



///DetailsPage Bloc
  DetailsPageBloc(int id) {

    movieDBApply.getSingleMovieDetailsFromDataBaseStream(id).listen((value) {
      _movieDetails = value;
       _movieLink=_movieDetails?.backdropPath ?? '';
       _date=_movieDetails?.releaseDate ?? '';
       _title=_movieDetails?.title??'';
       _voteCount=_movieDetails?.voteCount?? 0;
       _voteAverage=_movieDetails?.voteAverage ?? 0.0;
       _year=_date.split('-').first;
       _time=_movieDetails?.runtime?? 0;
       _timeString=_time.toString();
       _movieType=_movieDetails?.genres?? [];
       _overView=_movieDetails?.overview ?? '';
       _originalTitle=_movieDetails?.originalTitle ?? ' ';
       _genreList=_movieDetails?.genres?.map((e) => e.name).toList();
       _movieGenres=_genreList?.join(", ") ?? '';
       _production=_movieDetails?.productionCountries?.map((e) => e.name) .toString() ?? '';
       _releaseDate=_movieDetails?.releaseDate?? '';
       _description=_movieDetails?.overview?? '';
       _rate=_movieDetails?.voteAverage?? 0.0;
       notifyListeners();
    });

    movieDBApply.getCreditsResponseFromDataBaseStream(id).listen((value) {
      _movieCast = value?.cast ?? [];
      notifyListeners();
    });

    movieDBApply.getCreditsResponseFromDataBaseStream(id).listen((value) {
      _movieCrew=value?.crew ?? [];
      notifyListeners();
    });
    // movieDBApply.getMovieDetailsCreatorsFromDataBaseStream(id).listen((value) {
    //     _movieCrew=value ?? [];
    //   notifyListeners();
    // });

    movieDBApply.getSimilarMovies(id, _page).then((value) {
        _similarMoviesList=value ?? [];
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
                _similarMoviesList.add(element);
              });
             notifyListeners();
            }
          });
        }
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }
}
