import 'package:dio/dio.dart';
import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/network/data_agent/movie_data_agent.dart';

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
}
