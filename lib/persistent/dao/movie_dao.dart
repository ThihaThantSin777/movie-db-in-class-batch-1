import '../../data/vos/movie_vo/movie_vo/movie_vo.dart';

abstract class MovieDAO{

  void save(List<MovieVO> movieList);

  List<MovieVO>? getAllMoviesFromDatabase();

  Stream watchBox();

  Stream<List<MovieVO>?> getAllMoviesFromDatabaseStream();
}