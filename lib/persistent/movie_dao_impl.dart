import 'package:hive/hive.dart';
import 'package:movie_db/data/vos/credits_vo/cast_vo/cast_vo.dart';
import 'package:movie_db/data/vos/credits_vo/crew_vo/crew_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/data/vos/result_vo/result_vo.dart';
import 'package:movie_db/network/response/credits_response/credits_response.dart';
import 'package:movie_db/network/response/movie_details_response/movie_details_response.dart';
import 'package:movie_db/persistent/movie_dao.dart';

import '../constant/persistent_constant.dart';

class MovieDAOImpl extends MovieDAO {
  MovieDAOImpl._();

  static final MovieDAOImpl _singleton = MovieDAOImpl._();

  factory MovieDAOImpl() => _singleton;

  /// Box Creating
  Box<MovieVO> _getMoviesBox() =>
      Hive.box<MovieVO>(kHiveBoxMovie);// Box Creates For MovieVO

  Box<ResultsVO> _getActorsBox() =>
      Hive.box<ResultsVO>(kHiveActorsBox); // Box Creates For ResultVO

  Box<MovieDetailsResponse> _getMovieDetailsBox() =>
      Hive.box<MovieDetailsResponse>(kHiveMovieDetailsBox);

  Box<CastVO> _getMovieDetailsActorsBox() =>
      Hive.box<CastVO>(kHiveMovieDetailsActorsBox);

  Box<CrewVO> _getMovieDetailsCreatorsBox()=>
      Hive.box<CrewVO>(kHiveMovieDetailsCreatorsBox);

  Box<CreditsResponse> _getMovieCreditsResponseBox()=>
      Hive.box<CreditsResponse>(kHiveMovieCreditsResponseBox);


  @override
  void save(List<MovieVO> movies) {
    // Map<int,MovieVO> movieMap={for (var movies in movies) movies.id ?? -1: movies };
    // _getMoviesBox().putAll(movieMap);

    // Map<int,MovieVO> movieMap=Map.fromIterable(movies,
    //     key: (movies)=>movies.id,
    // value: (movies)=>movies);

    movies.forEach((element) {
      _getMoviesBox().
      put(element.id, element);
    });
    print("----------Your Data are saved successfully in Database.----------");
  }

  @override
  List<MovieVO>? getAllMoviesFromDataBase() => _getMoviesBox().values.toList();

  @override
  Stream watchMovieBox() => _getMoviesBox().watch();

  @override
  Stream watchActorBox() => _getActorsBox().watch();

  @override
  Stream watchMovieDetailsActorsBox() => _getMovieDetailsActorsBox().watch();

  @override
  Stream watchMovieDetailsBox() => _getMovieDetailsBox().watch();

  @override
  Stream watchMovieDetailsCreatorsBox() => _getMovieDetailsCreatorsBox().watch();

  @override
  Stream watchMovieCreditsResponseBox() => _getMovieCreditsResponseBox().watch();



  @override
  Stream<List<MovieVO>?> getAllMoviesFromDataBaseStream() =>
      Stream.value(getAllMoviesFromDataBase());

  @override
  List<MovieVO>? getAllPopularMoviesFromDataBase() =>
      getAllMoviesFromDataBase()
          ?.where((element) => element.isPopularMovies ?? false)
          .toList();

  @override
  Stream<List<MovieVO>?> getAllPopularMoviesFromDataBaseStream() =>
      Stream.value(getAllPopularMoviesFromDataBase());


  ///Actors
  @override
  void saveActors(List<ResultsVO> actors) {
    actors.forEach((element) {
      _getActorsBox().put(element.id, element);
      print("*******************----------Your  Data are saved successfully in Database.----------****************");

    });
}
  @override
  List<ResultsVO>? getAllActorsFromDataBase() =>_getActorsBox().values.toList();

  @override
  Stream<List<ResultsVO>?> getAllActorsFromDatabaseStream() =>Stream.value(getAllActorsFromDataBase());

  /// SingleMovieDetails
  @override
  MovieDetailsResponse? getSingleMovieDetailsFromDatabase(int id) =>_getMovieDetailsBox().get(id);


  @override
  Stream<MovieDetailsResponse?> getSingleMovieDetailsFromDatabaseStream(int id)=>
      Stream.value(getSingleMovieDetailsFromDatabase(id));


  @override
  void saveMovieDetails(MovieDetailsResponse movieDetailsVO) =>
      _getMovieDetailsBox().put(movieDetailsVO.id, movieDetailsVO);


  /// MovieDetailsActors
  @override
  void saveMovieDetailsActors(List<CastVO> castVO) {
    castVO.forEach((element) {
      _getMovieDetailsActorsBox().put(element.id, element);
    });
    print("*******************----------Your Details Data are saved successfully in Database.----------****************");

  }

  @override
  List<CastVO>? getMovieDetailsActorsFromDataBase(int id) =>_getMovieDetailsActorsBox().values.toList();

  @override
  Stream<List<CastVO>?> getMovieDetailsActorsFromDataBaseStream(int id) => Stream.value(getMovieDetailsActorsFromDataBase(id));


  /// MovieDetailsCreators
  @override
  void saveMovieDetailsCreators(List<CrewVO> crewVO) {
    crewVO.forEach((element) {
      _getMovieDetailsCreatorsBox().put(element.id, element);
    });
    print("*******************----------Your Details Data are saved successfully in Database.----------****************");

  }

  @override
  List<CrewVO>? getMovieDetailsCreatorsFromDataBase(int id) => _getMovieDetailsCreatorsBox().values.toList();

  @override
  Stream<List<CrewVO>?> getMovieDetailsCreatorsFromDataBaseStream(int id) => Stream.value(getMovieDetailsCreatorsFromDataBase(id));
///Saving CreditsResponse
  @override
  CreditsResponse? getMoviesCreditsResponseFromDataBase(int id) =>_getMovieCreditsResponseBox().get(id);

  @override
  Stream<CreditsResponse?> getMoviesCreditsResponseFromDataBaseStream(int id) => Stream.value(getMoviesCreditsResponseFromDataBase(id)) ;


  @override
  void saveMoviesCreditsResponse(CreditsResponse creditsResponse) {
    _getMovieCreditsResponseBox().put(creditsResponse.id, creditsResponse);
  }

// /// SimilarMovies
// @override
// List<MovieVO>? getSimilarMoviesFromDataBase(int id,int page) =>getAllMoviesFromDataBase()
//     ?.where((element) => element.isSimilarMovies ?? false)
//     .toList();
//
// @override
// Stream<List<MovieVO>?> getSimilarMoviesFromDataBaseStream(int id,int page) =>Stream.value(getSimilarMoviesFromDataBase(id,page));
//
// @override
// void saveSimilarMovies(List<MovieVO> similarMovieList) {
//   // TODO: implement saveSimilarMovies
// }
}
