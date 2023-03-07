import 'package:movie_db/data/vos/movie_vo/movie_vo/movie_vo.dart';

import '../../network/response/detail_response/detail_response.dart';
import '../vos/actor_vo/actor_vo.dart';
import '../vos/credit_vo/cast_vo.dart';
import '../vos/credit_vo/crew_vo.dart';
import '../vos/genre_vo/genre_vo.dart';

abstract class MovieDBApply{

  ///For Network
  Future<List<MovieVO>?>getNowPlayingMovies(int page);

  Future<int?>getTotalPage(int page);

  Future<List<MovieVO>?>getPopularMovie(int page);

  Future<List<GenreVO>?> getGenre();

  Future<List<MovieVO>?> getGenreMovie(int genre,int page);

  Future<List<ActorVO>?> getKnowForActor(int page);

  Future<DetailResponse?> getDetails(int movieId);

  Future<List<CastVO>?> getCast(int movieId);

  Future<List<CrewVO>?> getCrew(int movieId);

  Future<List<MovieVO>?> getSimilarMovie(int page,int movieId);
  /// For DataBase

  void save(List<MovieVO> movieList);

  List<MovieVO>? getAllMoviesFromDatabase();

  Stream<List<MovieVO>?> getAllMoviesFromDatabaseStream(int page);

  Stream<DetailResponse?> getSingleMovieFromDatabaseStream(int movieId);

  Stream<List<MovieVO>?> getAllGenreMovieFromDatabaseSteam(int genre,int page);
}