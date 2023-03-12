import 'package:movie_db/data/vos/credits_vo/cast_vo/cast_vo.dart';
import 'package:movie_db/data/vos/credits_vo/crew_vo/crew_vo.dart';
import 'package:movie_db/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/network/response/credits_response/credits_response.dart';

import '../../data/vos/result_vo/result_vo.dart';
import '../response/movie_details_response/movie_details_response.dart';

abstract class MovieDataAgent{
  Future<List<MovieVO>?>getNowPlaying(int page);

  Future<int?>getTotalPage(int page);

  Future<List<MovieVO>?> getPopularMovies(int page);

  Future<List<ResultsVO>?> getActors(int page);

  Future<List<GenresVO>?> getGenera(String kApiKey);

  Future<List<MovieVO>?> getMoviesByGenera(int page,int generaId);

  Future<MovieDetailsResponse?> getMovieDetails(int movieID);

 Future<List<CastVO>?> getMovieCast(int movieID);

  Future<List<CrewVO>?> getMovieCrew(int movieID);

  Future<CreditsResponse?> getMovieCreditsResponse( int id);

  Future<List<MovieVO>?> getSimilarMovies(int movieID,int page);
}