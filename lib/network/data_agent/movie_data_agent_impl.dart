import 'package:dio/dio.dart';
import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/network/data_agent/movie_data_agent.dart';
import '../../data/vos/actors_vo/actors_vo.dart';
import '../../data/vos/cast_and_crews_vo/cast_vo/cast_vo.dart';
import '../../data/vos/cast_and_crews_vo/crew_vo/crew_vo.dart';
import '../../data/vos/details_vo/details_vo.dart';
import '../../data/vos/genres_vo/genres_vo.dart';
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
  Future<List<MovieVO>?> getPopularMovie(int page) => _api
      .getPopularMovies(kApiKey, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<MovieVO>?> getGenresMovie(int withGenres) => _api
      .getGenresMovies(withGenres, kApiKey)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<int?> getShowCaseMovie(int page) => _api
      .getPopularMovies(kApiKey, page)
      .asStream()
      .map((event) => event.totalPages)
      .first;

  @override
  Future<List<MovieVO>?> getSimilarMovie(int page, int movieID) => _api
      .getSimilarMovies(kApiKey, page, movieID)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<ActorsVO>?> getActors(int page) => _api
      .getActorsMovies(kApiKey, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<CrewVO>?> getCrew(int movieID) => _api
      .getCastAndCrew(kApiKey, movieID)!
      .asStream()
      .map((event) => event.crew)
      .first;

  @override
  Future<List<CastVO>?> getCast(int movieID) => _api
      .getCastAndCrew(kApiKey, movieID)!
      .asStream()
      .map((event) => event.cast)
      .first;

  @override
  Future<DetailsVO?> getDetails(int movieID) =>
      _api.getDetails(kApiKey, movieID).then((value) => value);

  @override
  Future<List<GenresVO>?> getGenresIdAndName() =>
      _api.getGenres(kApiKey).asStream().map((event) => event.genres).first;

  @override
  Future<int?> similarPage(int page, int movieID) => _api
      .getSimilarMovies(kApiKey, page, movieID)
      .asStream()
      .map((event) => event.totalPages)
      .first;
}
