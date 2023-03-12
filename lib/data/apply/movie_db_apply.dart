import 'package:movie_db/data/vos/credits_vo/cast_vo/cast_vo.dart';
import 'package:movie_db/data/vos/credits_vo/crew_vo/crew_vo.dart';
import 'package:movie_db/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_db/data/vos/known_for_vo/known_for_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/data/vos/result_vo/result_vo.dart';

import '../../network/response/credits_response/credits_response.dart';
import '../../network/response/movie_details_response/movie_details_response.dart';

abstract class MovieDBApply{

  ///For Network
  Future<List<MovieVO>?>getNowPlayingMovies(int page);

  Future<int?>getTotalPage(int page);

  Future<List<MovieVO>?> getPopularMovies(int page);

  Future<List<ResultsVO>?> getActors(int page);

  Future<List<KnownForVO>?> getAverage(int page);

  Future<List<GenresVO>?> getGenera();

  Future<List<MovieVO>?> getMoviesByGenera(int page,int generaId);

  Future<MovieDetailsResponse?> getMovieDetails(int movieID);

Future<List<CastVO>?> getMovieCast(int movieID);

Future<List<CrewVO>?> getMovieCrew(int movieID);

Future<CreditsResponse?> getMovieCreditsResponse( int id);


Future<List<MovieVO>?> getSimilarMovies(int movieID,int page);

/// For DataBase

    void save(List<MovieVO> movies);

    List<MovieVO> ? getMoviesListFromDatabase();

   Stream<List<MovieVO>?> getAllMoviesFromDataBaseStream(int page);

  List<MovieVO>? getAllPopularMoviesFromDataBase();

  Stream<List<MovieVO>?> getAllPopularMoviesFromDataBaseStream(int page);

  ///Actors
  void saveActors(List<ResultsVO> actors);

  List<ResultsVO>? getAllActorsFromDataBase();

  Stream<List<ResultsVO>?> getAllActorsFromDatabaseStream(int page);


  /// MovieDetails
  void saveMovieDetails(MovieDetailsResponse movieDetailsVO);

  MovieDetailsResponse ? getSingleMovieDetailsFromDataBase(int id);

  Stream<MovieDetailsResponse?>  getSingleMovieDetailsFromDataBaseStream( int id);

///Credits Response
  Stream<CreditsResponse?> getCreditsResponseFromDataBaseStream(int id);
  /// MovieDetailsActors

  void saveMovieDetailsActors(List<CastVO> castVO);

  List<CastVO?>?  getMovieDetailsActorsFromDataBase(int id);

  Stream<List<CastVO?>?> getMovieDetailsActorsFromDataBaseStream(int id);

  /// MovieDetailsCreators

  void saveMovieDetailsCreators(List<CrewVO> crewVO);

  List<CrewVO?>? getMovieDetailsCreatorsFromDataBase(int id);

  Stream<List<CrewVO?>?> getMovieDetailsCreatorsFromDataBaseStream(int id);


  // /// SimilarMovies
  //
  // List<MovieVO>? getSimilarMoviesFromDataBase(int id,int page);
  //
  // Stream<List<MovieVO>?> getSimilarMoviesFromDataBaseStream(int id,int page);


}