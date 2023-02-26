import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../constant/api_constant.dart';
import '../../data/vos/details_vo/details_vo.dart';
import '../response/actors_response/actor_response.dart';
import '../response/cast_and_crew_response/cast_and_crew_response.dart';
import '../response/movie_response/genres_response/genres_response.dart';
import '../response/movie_response/movie_response.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class MovieAPI {
  factory MovieAPI(Dio dio) => _MovieAPI(dio);

  @GET(kGetNowPlayingEndPoint)
  Future<MovieResponse> getNowPlayingMovies(
    @Query(kQueryParamsAPIKey) String apiKey,
    @Query(kQueryParamsPage) int page,
  );

  @GET(kPopularMovieEndPoint)
  Future<MovieResponse> getPopularMovies(
    @Query(kQueryParamsAPIKey) String apiKey,
    @Query(kQueryParamsPage) int page,
  );

  @GET(kGenresMoviesEndPoint)
  Future<MovieResponse> getGenresMovies(
    @Query(kQueryWithGenres) int withGenres,
    @Query(kQueryParamsAPIKey) String apiKey,
  );

  @GET(kSimilarEndPoint)
  Future<MovieResponse> getSimilarMovies(
    @Query(kQueryParamsAPIKey) String apiKey,
    @Query(kQueryParamsPage) int page,
    @Query(kPathParameterMovieID) int movieID,
  );

  @GET(kDetailsEndPoint)
  Future<DetailsVO> getDetails(
      @Query(kApiKey) String apiKey,
      @Path(kPathParameterMovieID) int movieID,
      );


  @GET(kCastAndCrewEndPoint)
  Future<CastAndCrewResponse>? getCastAndCrew(
      @Query(kApiKey) String apiKey,
      @Path(kPathParameterMovieID) int movieID,
      );

  @GET(kActorsMovieEndPoint)
  Future<ActorResponse> getActorsMovies(
      @Query(kQueryParamsAPIKey) String apiKey,
      @Query(kQueryParamsPage) int page,
      );


  @GET(kGenresEndPoint)
  Future<GenresResponse> getGenres(
      @Query(kQueryParamsAPIKey) String apiKey
      );
}
