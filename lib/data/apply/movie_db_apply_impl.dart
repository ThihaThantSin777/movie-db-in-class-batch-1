import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/credits_vo/cast_vo/cast_vo.dart';
import 'package:movie_db/data/vos/credits_vo/crew_vo/crew_vo.dart';
import 'package:movie_db/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_db/data/vos/known_for_vo/known_for_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/data/vos/result_vo/result_vo.dart';
import 'package:movie_db/network/data_agent/movie_data_agent.dart';
import 'package:movie_db/network/data_agent/movie_data_agent_impl.dart';
import 'package:movie_db/network/response/credits_response/credits_response.dart';
import 'package:movie_db/network/response/movie_details_response/movie_details_response.dart';
import 'package:movie_db/persistent/movie_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../persistent/movie_dao.dart';

class MovieDBApplyImpl extends MovieDBApply {
  MovieDBApplyImpl._();

  static final MovieDBApplyImpl _singleton = MovieDBApplyImpl._();

  factory MovieDBApplyImpl() => _singleton;

  final MovieDataAgent _movieDataAgent = MovieDataAgentImpl();

  final MovieDAO _movieDAO = MovieDAOImpl();

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) =>
      _movieDataAgent.getNowPlaying(page).then((value) {
        final temp = value?.map((e) {
          e.isGetNowPlaying = true;
          return e;
        }).toList();

        _movieDAO.save(temp ?? []);

        return temp;
      });

  @override
  Future<int?> getTotalPage(int page) => _movieDataAgent.getTotalPage(page);

  @override
  Future<List<MovieVO>?> getPopularMovies(int page) =>
      _movieDataAgent.getPopularMovies(page).then((value) {
        final temp = value?.map((e) {
          e.isPopularMovies = true;
          return e;
        }).toList();
        _movieDAO.save(temp ?? []);
        return temp;
      });

  @override
  Future<List<ResultsVO>?> getActors(int page) =>
      _movieDataAgent.getActors(page).then((value) {
        final temp = value;
        _movieDAO.saveActors(temp ?? []);
        return temp;
      });

  @override
  Future<List<KnownForVO>?> getAverage(int page) async {
    List<KnownForVO> result = [];
    final temp = await _movieDataAgent.getActors(page);
    temp?.forEach((element) {
      result = element.knownFor ?? [];
    });
    return result;
  }

  @override
  Future<List<GenresVO>?> getGenera() => _movieDataAgent.getGenera(kApiKey);

  @override
  Future<List<MovieVO>?> getMoviesByGenera(int page, int generaId) =>
      _movieDataAgent.getMoviesByGenera(page, generaId).then((value) {
        final temp = value?.map((e) {
          e.isGenreMovies = true;
          return e;
        }).toList();
        return temp;
      });

  @override
  Future<MovieDetailsResponse?> getMovieDetails(int movieID) =>
      _movieDataAgent.getMovieDetails(movieID).then((value) {
        if(value !=null) {
          _movieDAO.saveMovieDetails(value);
        }
        return value;

      });

  @override
  Future<List<CastVO>?> getMovieCast(int movieID) =>
      _movieDataAgent.getMovieCast(movieID).then((value) {
        final temp=value ?? [];
        _movieDAO.saveMovieDetailsActors(temp);
        return temp;
      });

  @override
  Future<List<CrewVO>?> getMovieCrew(int movieID) =>
      _movieDataAgent.getMovieCrew(movieID).then((value) {
        final temp=value ?? [];
        _movieDAO.saveMovieDetailsCreators(temp);
        return temp;
      });

  @override
  Future<List<MovieVO>?> getSimilarMovies(int movieID, int page) =>
      _movieDataAgent.getSimilarMovies(movieID, page);

  /// AllMovies
  @override
  List<MovieVO>? getMoviesListFromDatabase() =>
      _movieDAO.getAllMoviesFromDataBase();

  @override
  void save(List<MovieVO> movies) => _movieDAO.save(movies);

  @override
  Stream<List<MovieVO>?> getAllMoviesFromDataBaseStream(int page) {
    getNowPlayingMovies(page);
    return _movieDAO
        .watchMovieBox()
        .startWith(_movieDAO.getAllMoviesFromDataBaseStream())
        .map((event) => _movieDAO.getAllMoviesFromDataBase());
    //.map((event){
    //return Stream.value(_movieDAO.getAllMoviesFromDataBase());
    //});
  }

  /// AllPopularMovies
  @override
  List<MovieVO>? getAllPopularMoviesFromDataBase() =>
      _movieDAO.getAllPopularMoviesFromDataBase();

  @override
  Stream<List<MovieVO>?> getAllPopularMoviesFromDataBaseStream(int page) {
    getPopularMovies(page);
    return _movieDAO
        .watchMovieBox()
        .startWith(_movieDAO.getAllPopularMoviesFromDataBaseStream())
        .map((event) => _movieDAO.getAllPopularMoviesFromDataBase());
  }

  /// Actors
  @override
  void saveActors(List<ResultsVO> actors) => _movieDAO.saveActors(actors);

  @override
  List<ResultsVO>? getAllActorsFromDataBase() =>
      _movieDAO.getAllActorsFromDataBase();

  @override
  Stream<List<ResultsVO>?> getAllActorsFromDatabaseStream(int page) {
    getActors(page);
    return _movieDAO
        .watchActorBox()
        .startWith(_movieDAO.getAllActorsFromDatabaseStream())
        .map((event) => _movieDAO.getAllActorsFromDataBase());
  }

  /// SingleMovieDetails
  @override
  MovieDetailsResponse? getSingleMovieDetailsFromDataBase(int id) =>
      _movieDAO.getSingleMovieDetailsFromDatabase(id);

  @override
  Stream<MovieDetailsResponse?> getSingleMovieDetailsFromDataBaseStream(int id) {
    getMovieDetails(id);
    return _movieDAO
        .watchMovieDetailsBox()
        .startWith(_movieDAO.getSingleMovieDetailsFromDatabaseStream(id))
        .map((event) => _movieDAO.getSingleMovieDetailsFromDatabase(id));
  }

  @override
  void saveMovieDetails(MovieDetailsResponse movieDetailsVO) =>
      _movieDAO.saveMovieDetails(movieDetailsVO);

  /// MovieDetailsActors
  @override
  List<CastVO?>? getMovieDetailsActorsFromDataBase(int id) =>
      _movieDAO.getMovieDetailsActorsFromDataBase(id);

  @override
  Stream<List<CastVO?>?> getMovieDetailsActorsFromDataBaseStream(int id) {
    getMovieCast(id);
    return _movieDAO
        .watchMovieDetailsActorsBox()
        .startWith(_movieDAO.getMovieDetailsActorsFromDataBaseStream(id))
        .map((event) => _movieDAO.getMovieDetailsActorsFromDataBase(id));
  }

  @override
  void saveMovieDetailsActors(List<CastVO> castVO) =>
      _movieDAO.saveMovieDetailsActors(castVO);

  /// MovieDetailsCreators

  @override
  void saveMovieDetailsCreators(List<CrewVO> crewVO) =>
      _movieDAO.saveMovieDetailsCreators(crewVO);

  @override
  List<CrewVO?>? getMovieDetailsCreatorsFromDataBase(int id) =>
      _movieDAO.getMovieDetailsCreatorsFromDataBase(id);

  @override
  Stream<List<CrewVO?>?> getMovieDetailsCreatorsFromDataBaseStream(int id) {
    getMovieCrew(id);
    return _movieDAO
        .watchMovieDetailsCreatorsBox()
        .startWith(_movieDAO.getMovieDetailsCreatorsFromDataBaseStream(id))
        .map((event) => _movieDAO.getMovieDetailsCreatorsFromDataBase(id));
  }

  @override
  Future<CreditsResponse?> getMovieCreditsResponse(int id) =>
      _movieDataAgent.getMovieCreditsResponse(id).then((value) {

        if(value!=null) {

          _movieDAO.saveMoviesCreditsResponse(value);
          print("########################### Your Data are saved.###############################");
        }
        return value;
      });

  @override
  Stream<CreditsResponse?> getCreditsResponseFromDataBaseStream(int id) {
    getMovieCreditsResponse(id);
    return _movieDAO
        .watchMovieCreditsResponseBox()
        .startWith(_movieDAO.getMoviesCreditsResponseFromDataBaseStream(id))
        .map((event) => _movieDAO.getMoviesCreditsResponseFromDataBase(id));
  }


  // /// SimilarMovies
  // @override
  // List<MovieVO>? getSimilarMoviesFromDataBase(int id, int page) =>
  //     _movieDAO.getSimilarMoviesFromDataBase(id, page);
  //
  // @override
  // Stream<List<MovieVO>?> getSimilarMoviesFromDataBaseStream(int id, int page) {
  //   getSimilarMovies(id, page);
  //   return _movieDAO
  //       .watchMovieBox()
  //       .startWith(_movieDAO.getSimilarMoviesFromDataBase(id, page))
  //       .map((event) => _movieDAO.getSimilarMoviesFromDataBase(id, page));
  // }
}
