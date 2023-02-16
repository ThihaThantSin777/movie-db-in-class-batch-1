
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/credit_vo/cast_vo.dart';
import 'package:movie_db/data/vos/credit_vo/crew_vo.dart';
import 'package:movie_db/data/vos/genre_vo/genre_vo.dart';
import 'package:movie_db/data/vos/know_for_vo/know_for_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo/movie_vo.dart';
import 'package:movie_db/network/data_agent/movie_data_agent.dart';
import 'package:movie_db/network/data_agent/movie_data_agent_impl.dart';
import 'package:movie_db/network/response/detail_response/detail_response.dart';

import '../vos/actor_vo/actor_vo.dart';

class MovieDBApplyImpl extends MovieDBApply{

  MovieDBApplyImpl._();

  static final MovieDBApplyImpl _singleton=MovieDBApplyImpl._();

  factory MovieDBApplyImpl()=>_singleton;

  final MovieDataAgent _movieDataAgent=MovieDataAgentImpl();

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) =>_movieDataAgent.getNowPlaying(page).then((value) {

    final temp=value?.map((e) {
      e.isGetNowPlaying=true;
      return e;
    }).toList();
    return temp;
  });

  @override
  Future<int?> getTotalPage(int page) =>_movieDataAgent.getTotalPage(page);

  @override
  Future<List<MovieVO>?> getPopularMovie(int page) =>
      _movieDataAgent.getPopularMovie(page).then((value) {
        final temp = value?.map((e) {
          e.isPopularMovies = true;
          return e;
        }).toList();
        return temp;
      });

  @override
  Future<List<GenreVO>?> getGenre()=> _movieDataAgent.getGenre();

  @override
  Future<List<MovieVO>?> getGenreMovie(int genre, int page) =>
      _movieDataAgent.getGenreMovie(genre, page).then((value) {
        final temp = value?.map((e) {
          e.isGenre = true;
          return e;
        }).toList();
        return temp;
      });

  @override
  Future<List<ActorVO>?> getKnowForActor(int page) =>
    _movieDataAgent.getActor(page).then((value) => value);

  @override
  Future<DetailResponse?> getDetails(int movieId) {
    return _movieDataAgent.getDetails(movieId).then((value) => value);
  }

  @override
  Future<List<CastVO>?> getCast(int movieId) =>
      _movieDataAgent.getCast(movieId).then((value) {
     return value;
      });

  @override
  Future<List<CrewVO>?> getCrew(int movieId) =>
      _movieDataAgent.getCrew(movieId).then((value) {
      return value;
      });

  @override
  Future<List<MovieVO>?> getSimilarMovie(int page, int movieId) =>
  _movieDataAgent.getSimilarMovie(page, movieId);




}