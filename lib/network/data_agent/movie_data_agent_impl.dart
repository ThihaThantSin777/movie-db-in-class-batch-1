import 'package:dio/dio.dart';
import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/data/vos/credit_vo/cast_vo.dart';
import 'package:movie_db/data/vos/genre_vo/genre_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo/movie_vo.dart';
import 'package:movie_db/network/data_agent/movie_data_agent.dart';
import 'package:movie_db/network/response/detail_response/detail_response.dart';

import '../../data/vos/actor_vo/actor_vo.dart';
import '../../data/vos/credit_vo/crew_vo.dart';
import '../api/movie_api.dart';

class MovieDataAgentImpl extends MovieDataAgent {
  late MovieAPI _api;

  MovieDataAgentImpl._() {
    _api = MovieAPI(Dio());
  }

  static final MovieDataAgentImpl _singleton = MovieDataAgentImpl._();

  factory MovieDataAgentImpl() => _singleton;

  @override
  Future<List<MovieVO>?> getNowPlaying(int page) => _api
      .getNowPlayingMovies(kApiKey, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<int?> getTotalPage(int page) => _api
      .getNowPlayingMovies(kApiKey, page)
      .asStream()
      .map((event) => event.totalPages)
      .first;

  @override
  Future<List<MovieVO>?> getPopularMovie(int page) =>
      _api.getPopularMovie(kApiKey, page)
          .asStream().map((event) => event.results)
          .first;

  @override
  Future<List<GenreVO>?> getGenre() =>
    _api.getGenre(kApiKey).then((value) => value.genres);

  @override
  Future<List<MovieVO>?> getGenreMovie(int genre, int page) =>
    _api.getGenreMovie(genre, kApiKey, page).asStream().map((event) => event.results).first;

  @override
  Future<List<ActorVO>?> getActor(int page) =>
    _api.getActor(kApiKey, page).asStream().map((event)=>
      event.results).first;

  @override
  Future<DetailResponse?> getDetails(int movieId) =>
      _api.getDetails(kApiKey, movieId).then((value) => value);

  @override
  Future<List<CastVO>?> getCast(int movieId) =>
      _api.getCastAndCrew(kApiKey, movieId).asStream().map((e) => e.castList).first;

  @override
  Future<List<CrewVO>?> getCrew(int movieId) =>
      _api.getCastAndCrew(kApiKey, movieId).asStream().map((e) => e.crewList).first;

  @override
  Future<List<MovieVO>?> getSimilarMovie(int page, int movieId) =>
    _api.getSimilarMovie(kApiKey, page, movieId).asStream().map((event) => event.results).first;

}
