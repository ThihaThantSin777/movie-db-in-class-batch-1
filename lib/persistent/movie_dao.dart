import 'package:movie_db/network/response/credits_response/credits_response.dart';
import 'package:movie_db/network/response/movie_details_response/movie_details_response.dart';

import '../data/vos/credits_vo/cast_vo/cast_vo.dart';
import '../data/vos/credits_vo/crew_vo/crew_vo.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../data/vos/result_vo/result_vo.dart';

abstract class MovieDAO{

  Stream watchMovieBox();

  Stream watchActorBox();

  Stream watchMovieDetailsBox();

  Stream watchMovieDetailsActorsBox();

  Stream watchMovieDetailsCreatorsBox();

  Stream watchMovieCreditsResponseBox();

  void save(List<MovieVO> movies);

  List<MovieVO>? getAllMoviesFromDataBase();

  Stream<List<MovieVO>?> getAllMoviesFromDataBaseStream();

  ///Popular Movies
  List<MovieVO>? getAllPopularMoviesFromDataBase();

  Stream<List<MovieVO>?> getAllPopularMoviesFromDataBaseStream();

  ///Actors
  void saveActors(List<ResultsVO> actors);

  List<ResultsVO>? getAllActorsFromDataBase();

  Stream<List<ResultsVO>?> getAllActorsFromDatabaseStream();

  /// MovieDetails
  void saveMovieDetails(MovieDetailsResponse movieDetailsResponse);

  MovieDetailsResponse ? getSingleMovieDetailsFromDatabase(int id);

  Stream<MovieDetailsResponse?> getSingleMovieDetailsFromDatabaseStream(int id);


  ///Saving MovieCredits
  void saveMoviesCreditsResponse(CreditsResponse creditsResponse);

  CreditsResponse ? getMoviesCreditsResponseFromDataBase(int id);

  Stream<CreditsResponse?> getMoviesCreditsResponseFromDataBaseStream(int id);


 /// MovieDetailsActors

  void saveMovieDetailsActors(List<CastVO> castVO);

  List<CastVO>? getMovieDetailsActorsFromDataBase(int id);

  Stream<List<CastVO>?> getMovieDetailsActorsFromDataBaseStream(int id);

/// MovieDetailsCreators

void saveMovieDetailsCreators(List<CrewVO> crewVO);

  List<CrewVO>? getMovieDetailsCreatorsFromDataBase(int id);

Stream<List<CrewVO>?> getMovieDetailsCreatorsFromDataBaseStream(int id);

// /// SimilarMovies
//
//   void saveSimilarMovies(List<MovieVO> similarMovieList);
//
//   List<MovieVO>? getSimilarMoviesFromDataBase(int id,int page);
//
//   Stream<List<MovieVO>?> getSimilarMoviesFromDataBaseStream(int id,int page);


}