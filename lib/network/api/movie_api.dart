import 'package:dio/dio.dart';
import 'package:movie_db/network/response/similar_movies_response/similar_movies_response.dart';
import 'package:retrofit/http.dart';

import '../../constant/api_constant.dart';
import '../response/actors_response/actors_response.dart';
import '../response/credits_response/credits_response.dart';
import '../response/genres_response/genres_response.dart';
import '../response/movie_details_response/movie_details_response.dart';
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
  
  @GET(kGetPopularMovingEndPoint)
  Future<MovieResponse> getPopularMovies(
      @Query(kQueryParamsAPIKey) String apiKey,
      @Query(kQueryParamsPage) int page,
      );

  @GET(kGetActorsEndPoint)
  Future<ActorsResponse> getActors(
      @Query(kQueryParamsAPIKey) String apiKey,
      @Query(kQueryParamsPage) int page,
      );
  
  @GET(kGetGeneraEndPoint)
  Future<GenresResponse> getGenera(
      @Query(kQueryParamsAPIKey) String apiKey,
      );
  
  @GET(kGetMovieByGeneraEndPoint)
  Future<MovieResponse> getMoviesByGenera(
      @Query(kQueryParamsAPIKey) String apiKey,
      @Query(kQueryParamsPage) int page,
      @Query(kQueryParamsWithGenres) int generaId,
      );

  @GET(kGetMovieDetailsEndPoint)
  Future<MovieDetailsResponse> getMovieDetails(
      @Query(kQueryParamsAPIKey) String apiKey,
      @Path(kPathParameterMovieID) int movieId,
      );

  @GET(kGetMovieCreditsEndPoint)
  Future<CreditsResponse> getMovieCredits(
      @Query(kQueryParamsAPIKey) String apiKey,
      @Path(kPathParameterMovieID) int movieId,
      );

   @GET(kGetMovieSimilarEndPoint)
   Future<SimilarMoviesResponse> getMovieSimilar(
       @Query(kQueryParamsAPIKey) String apiKey,
       @Path(kPathParameterMovieID) int movieId,
       @Query(kQueryParamsPage) int page,
       );
 }
