import '../../data/vos/movie_vo/movie_vo/movie_vo.dart';
import '../../network/response/detail_response/detail_response.dart';

abstract class MovieDAO{

  void save(List<MovieVO> movieList);

  void saveDetail(DetailResponse detail);
  List<MovieVO>? getAllMoviesFromDatabase();

  DetailResponse? getSingleMovie(int movieId);

  Stream watchDetailsBox();

  Stream watchBox();

  Stream<List<MovieVO>?> getAllMoviesFromDatabaseStream();

  Stream<DetailResponse?> getSingleMovieFromDatabaseStream(int movieId);
}