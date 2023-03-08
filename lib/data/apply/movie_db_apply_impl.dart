import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/credit_vo/cast_vo.dart';
import 'package:movie_db/data/vos/credit_vo/crew_vo.dart';
import 'package:movie_db/data/vos/genre_vo/genre_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo/movie_vo.dart';
import 'package:movie_db/network/data_agent/movie_data_agent.dart';
import 'package:movie_db/network/data_agent/movie_data_agent_impl.dart';
import 'package:movie_db/network/response/detail_response/detail_response.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../persistent/dao/movie_dao.dart';
import '../../persistent/dao/movie_dao_impl.dart';
import '../vos/actor_vo/actor_vo.dart';

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
  Future<List<MovieVO>?> getPopularMovie(int page) =>
      _movieDataAgent.getPopularMovie(page).then((value) {
        final temp = value?.map((e) {
          e.isPopularMovies = true;
          return e;
        }).toList();
        _movieDAO.save(temp ?? []);
        return temp;
      });


  @override
  Future<List<GenreVO>?> getGenre() => _movieDataAgent.getGenre();

  @override
  Future<List<MovieVO>?> getGenreMovie(int genre, int page) =>
      _movieDataAgent.getGenreMovie(genre, page).then((value) {
        final temp = value?.map((e) {
          e.isGenre = true;
          return e;
        }).toList();
        _movieDAO.save(temp ?? []);
        return temp;
      });

  @override
  Future<List<ActorVO>?> getKnowForActor(int page) =>
      _movieDataAgent.getActor(page).then((value) => value);

  @override
  Future<DetailResponse?> getDetails(int movieId) =>
     _movieDataAgent.getDetails(movieId).then((value) {
       if(value!= null){
       _movieDAO.saveDetail(value);
       }
       return value;
     });


  @override
  Future<List<CastVO>?> getCast(int movieId) =>
      _movieDataAgent.getCast(movieId).then((value) {
        return value;
      });

  @override
  Future<List<CrewVO>?> getCrew(int movieId) =>
      _movieDataAgent.getCrew(movieId).then((value) {
        return value;
      });

  @override
  Future<List<MovieVO>?> getSimilarMovie(int page, int movieId) =>
      _movieDataAgent.getSimilarMovie(page, movieId);

  @override
  List<MovieVO>? getAllMoviesFromDatabase() =>
      _movieDAO.getAllMoviesFromDatabase();

  @override
  Stream<List<MovieVO>?> getAllMoviesFromDatabaseStream(int page) {
    getNowPlayingMovies(page);
    getPopularMovie(page);
    return _movieDAO
        .watchBox()
        .startWith(_movieDAO.getAllMoviesFromDatabaseStream())
        .map((event) => _movieDAO.getAllMoviesFromDatabase());
  }

  @override
  void save(List<MovieVO> movieList) => _movieDAO.save(movieList);

  @override
  Stream<List<MovieVO>?> getAllGenreMovieFromDatabaseSteam(int genre, int page) {
    getGenreMovie(genre, page);
    return _movieDAO.watchBox()
        .startWith(_movieDAO.getAllMoviesFromDatabaseStream()).
    map((event) => _movieDAO.getAllMoviesFromDatabase());
  }

  @override
  Stream<DetailResponse?> getSingleMovieFromDatabaseStream(int movieId) {
    getDetails(movieId);
    return _movieDAO.watchDetailsBox().startWith(_movieDAO.getSingleMovieFromDatabaseStream(movieId)).map((event) => _movieDAO.getSingleMovie(movieId));
  }

}
