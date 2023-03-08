import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../constant/api_constant.dart';
import '../response/actor_resoponse/actor_response.dart';
import '../response/credit_response/credit_response.dart';
import '../response/detail_response/detail_response.dart';
import '../response/genre_response/genre_response.dart';
import '../response/movie_response/movie_response.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class MovieAPI {

  factory MovieAPI(Dio dio)=>_MovieAPI(dio);

  @GET(kGetNowPlayingEndPoint)
  Future<MovieResponse> getNowPlayingMovies(
    @Query(kQueryParamsAPIKey) String apiKey,
    @Query(kQueryParamsPage) int page,
  );
  
  @GET(kGetPopularMovieEndPoint)
  Future<MovieResponse> getPopularMovie(
      @Query(kQueryParamsAPIKey) String apiKey,
      @Query(kQueryParamsPage) int page,
      );

  @GET(kGetGenerEndPoint)
  Future<GenreResponse> getGenre(
      @Query(kQueryParamsAPIKey) String apiKe
      );

  @GET(kGetGenreMovieEndPoint)
  Future<MovieResponse> getGenreMovie(
      @Query(kQueryParamsGenre) int genre,
      @Query(kQueryParamsAPIKey) String apiKey,
      @Query(kQueryParamsPage) int page,
      );

  @GET(kGetActorEndPoint)
  Future<ActorResponse> getActor(
      @Query(kQueryParamsAPIKey) String apiKey,
      @Query(kQueryParamsPage) int page,
      );

  @GET(kGetDetailEndPoint)
  Future<DetailResponse> getDetails(
      @Query(kQueryParamsAPIKey) String apiKey,
      @Path(kPath) int movieId,
      );

  @GET(kGetDetailCastAndCrewEndPoint)
  Future<CastAndCrewResponse> getCastAndCrew(
      @Query(kQueryParamsAPIKey) String apiKey,
      @Path(kPath) int movieId,
      );

  @GET(kGetSimilarMovieEndPoint)
  Future<MovieResponse> getSimilarMovie(
      @Query(kQueryParamsAPIKey) String apiKey,
      @Query(kQueryParamsPage) int page,
      @Path(kPath) int movieId,
      );
}
