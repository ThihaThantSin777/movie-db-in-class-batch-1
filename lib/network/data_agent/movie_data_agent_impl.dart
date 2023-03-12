import 'package:dio/dio.dart';
import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/data/vos/credits_vo/cast_vo/cast_vo.dart';
import 'package:movie_db/data/vos/credits_vo/crew_vo/crew_vo.dart';
import 'package:movie_db/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/data/vos/result_vo/result_vo.dart';
import 'package:movie_db/network/data_agent/movie_data_agent.dart';
import 'package:movie_db/network/response/credits_response/credits_response.dart';
import 'package:movie_db/network/response/movie_details_response/movie_details_response.dart';

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
  Future<List<MovieVO>?> getPopularMovies(int page) => _api
      .getPopularMovies(kApiKey, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<ResultsVO>?> getActors(int page) => _api
      .getActors(kApiKey, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<GenresVO>?> getGenera(String apiKey) =>
      _api.getGenera(kApiKey).then((value) => value.genres);

  @override
  Future<List<MovieVO>?> getMoviesByGenera(int page, int generaId) => _api
      .getMoviesByGenera(kApiKey, page, generaId)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<MovieDetailsResponse?> getMovieDetails(int movieID) =>
      _api.getMovieDetails(kApiKey, movieID).then((value) => value);

  @override
  Future<List<CastVO>?> getMovieCast(int movieID) => _api
      .getMovieCredits(kApiKey, movieID)
      .asStream()
      .map((event) => event.cast)
      .first;

  @override
  Future<List<CrewVO>?> getMovieCrew(int movieID) => _api
      .getMovieCredits(kApiKey, movieID)
      .asStream()
      .map((event) => event.crew)
      .first;

  @override
  Future<List<MovieVO>?> getSimilarMovies(int movieID, int page) => _api
      .getMovieSimilar(kApiKey, movieID, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<CreditsResponse?> getMovieCreditsResponse(int id)=>
      _api.getMovieCredits(kApiKey,id).then((value) => value);

}
