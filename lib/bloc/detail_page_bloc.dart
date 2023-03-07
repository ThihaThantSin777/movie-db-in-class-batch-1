import 'package:flutter/widgets.dart';

import '../data/apply/movie_db_apply.dart';
import '../data/apply/movie_db_apply_impl.dart';
import '../data/vos/credit_vo/cast_vo.dart';
import '../data/vos/credit_vo/crew_vo.dart';
import '../network/response/detail_response/detail_response.dart';

class DetailBloc extends ChangeNotifier{
  bool isChecked = false;
  int page = 1;

  final ScrollController _controller1 = ScrollController();
  final MovieDBApply _movieDBApply = MovieDBApplyImpl();
  DetailResponse? _movieDetails;
  List<CastVO> _getCast = [];
  List<CrewVO> _getCrew = [];

  DetailResponse? get getDetailResponse => _movieDetails;
  List<CastVO> get getCast => _getCast;
  List<CrewVO> get getCrew => _getCrew;
  ScrollController get getScrollController1 => _controller1;
  DetailBloc(int movieId){

    // detail response
    _movieDBApply.getSingleMovieFromDatabaseStream(movieId).listen((value) {
        _movieDetails = value;
    notifyListeners();
    });

    // cast list
    _movieDBApply.getCast(movieId).then((value) {
        _getCast = value ?? [];
      notifyListeners();
    });

    // crew list
    _movieDBApply.getCrew(movieId).then((value) {
        _getCrew = value ?? [];
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
  }
}