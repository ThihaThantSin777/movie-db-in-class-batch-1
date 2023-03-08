import 'package:movie_db/data/vos/credit_vo/cast_vo.dart';
import 'package:movie_db/data/vos/genre_vo/genre_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo/movie_vo.dart';
import 'package:movie_db/network/response/detail_response/detail_response.dart';

import '../../data/vos/actor_vo/actor_vo.dart';
import '../../data/vos/credit_vo/crew_vo.dart';

abstract class MovieDataAgent{
  Future<List<MovieVO>?>getNowPlaying(int page);

  Future<int?>getTotalPage(int page);

  Future<List<MovieVO>?> getPopularMovie(int page);

  Future<List<GenreVO>?> getGenre();

  Future<List<MovieVO>?> getGenreMovie(int genre,int page);

  Future<List<ActorVO>?> getActor(int page);

  Future<DetailResponse?> getDetails(int movieId);

  Future<List<CastVO>?> getCast(int movieId);

  Future<List<CrewVO>?> getCrew(int movieId);

  Future<List<MovieVO>?> getSimilarMovie(int page,int movieId);
}