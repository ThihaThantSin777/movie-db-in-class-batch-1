import 'package:hive/hive.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo/movie_vo.dart';
import 'package:movie_db/persistent/dao/movie_dao.dart';

import '../../constant/dao_constant.dart';

class MovieDAOImpl extends MovieDAO{
  MovieDAOImpl._();
  static final MovieDAOImpl _singleton = MovieDAOImpl._();
  factory MovieDAOImpl()=> _singleton;

  Box<MovieVO> _getMovieVOBox() => Hive.box<MovieVO>(kMovieBox);
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


}