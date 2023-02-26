import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import '../vos/actors_vo/actors_vo.dart';
import '../vos/cast_and_crews_vo/cast_vo/cast_vo.dart';
import '../vos/cast_and_crews_vo/crew_vo/crew_vo.dart';
import '../vos/details_vo/details_vo.dart';
import '../vos/genres_vo/genres_vo.dart';

abstract class MovieDBApply {
  ///For Network
  Future<List<MovieVO>?> getNowPlayingMovies(int page);

  Future<int?> getTotalPage(int page);

  Future<int?> getPopularTotalPage(int page);

  Future<List<MovieVO>?> getPopularMovies(int page);

  Future<List<MovieVO>?> getGenresMovies(int withGenres);

  Future<List<MovieVO>?> getSimilarMovie(int page);

  Future<List<ActorsVO>?> actors(int page);

  Future<List<CastVO>?> getCast(int movieID);

  Future<List<CrewVO>?> getCrew(int movieID);

  Future<DetailsVO?> getDetails(int movieID);

  Future<List<GenresVO>?> genresIdAndName();

  Future<int?> similarPage (int page,int movieID);

  /// For DataBase

}
