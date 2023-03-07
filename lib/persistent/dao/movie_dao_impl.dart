import 'package:hive/hive.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo/movie_vo.dart';
import 'package:movie_db/persistent/dao/movie_dao.dart';

import '../../constant/dao_constant.dart';
import '../../network/response/detail_response/detail_response.dart';

class MovieDAOImpl extends MovieDAO{
  MovieDAOImpl._();
  static final MovieDAOImpl _singleton = MovieDAOImpl._();
  factory MovieDAOImpl()=> _singleton;

  Box<MovieVO> _getMovieVOBox() => Hive.box<MovieVO>(kMovieBox);

  Box<DetailResponse> _getDetailBox()=> Hive.box(kDetailBox);
  @override
  List<MovieVO>? getAllMoviesFromDatabase() =>_getMovieVOBox().values.toList();

  @override
  void save(List<MovieVO> movieList) {
    for(var movie in movieList) {
      _getMovieVOBox().put(movie.id, movie);
    }
  }

  @override
  Stream<List<MovieVO>?> getAllMoviesFromDatabaseStream() => Stream.value(getAllMoviesFromDatabase());

  @override
  Stream watchBox()=> _getMovieVOBox().watch();

  @override
  Stream<DetailResponse?> getSingleMovieFromDatabaseStream(int movieId)=> Stream.value(getSingleMovie(movieId));

  @override
  DetailResponse? getSingleMovie(int movieId) => _getDetailBox().get(movieId);

  @override
  void saveDetail(DetailResponse detail) {
    _getDetailBox().put(detail.id, detail);
  }


}