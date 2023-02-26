import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/details_vo/details_vo.dart';
import 'package:movie_db/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/network/data_agent/movie_data_agent.dart';
import 'package:movie_db/network/data_agent/movie_data_agent_impl.dart';

import '../vos/actors_vo/actors_vo.dart';
import '../vos/cast_and_crews_vo/cast_vo/cast_vo.dart';
import '../vos/cast_and_crews_vo/crew_vo/crew_vo.dart';

class MovieDBApplyImpl extends MovieDBApply {
  MovieDBApplyImpl._();

  static final MovieDBApplyImpl _singleton = MovieDBApplyImpl._();

  factory MovieDBApplyImpl() => _singleton;

  final MovieDataAgent _movieDataAgent = MovieDataAgentImpl();

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) =>
      _movieDataAgent.getNowPlaying(page).then((value) {
        final temp = value?.map((e) {
          e.isGetNowPlaying = true;
          return e;
        }).toList();
        return temp;
      });

  @override
  Future<int?> getTotalPage(int page) => _movieDataAgent.getTotalPage(page);

  @override
  Future<List<MovieVO>?> getPopularMovies(int page) =>
      _movieDataAgent.getPopularMovie(page).then((value) {
        final temp = value?.map((e) {
          e.isPopularMovies = true;
          return e;
        }).toList();
        return temp;
      });

  @override
  Future<List<MovieVO>?> getGenresMovies(int withGenres) =>
      _movieDataAgent.getGenresMovie(withGenres).then((value) {
        final temp = value?.map((e) {
          e.isGenresMovies = true;
          return e;
        }).toList();
        return temp;
      });

  @override
  Future<int?> getPopularTotalPage(int page) =>
      _movieDataAgent.getShowCaseMovie(page);

  @override
  Future<List<MovieVO>?> getSimilarMovie(int page) =>
      _movieDataAgent.getNowPlaying(page).then((value) {
        final temp = value?.map((e) {
          e.isGenresMovies = true;
          return e;
        }).toList();
        return temp;
      });

  @override
  Future<List<ActorsVO>?> actors(int page) =>
      _movieDataAgent.getActors(page).then((value) {
        final temp = value?.map((e) {
          return e;
        }).toList();
        return temp;
      });

  @override
  Future<List<CastVO>?> getCast(int movieID) =>
      _movieDataAgent.getCast(movieID).then((value) {
        final temp = value?.map((e) {
          return e;
        }).toList();
        return temp;
      });

  @override
  Future<List<CrewVO>?> getCrew(int movieID) =>
      _movieDataAgent.getCrew(movieID).then((value) {
        final temp = value?.map((e) {
          return e;
        }).toList();
        return temp;
      });

  @override
  Future<DetailsVO?> getDetails(int movieID) =>
      _movieDataAgent.getDetails(movieID).then((value) => value);

  @override
  Future<List<GenresVO>?> genresIdAndName() =>
      _movieDataAgent.getGenresIdAndName().then((value) {
        final temp = value?.map((e) {
          return e;
        }).toList();
        return temp;
      });

  @override
  Future<int?> similarPage(int page, int movieID) =>
      _movieDataAgent.similarPage(page, movieID);
}
