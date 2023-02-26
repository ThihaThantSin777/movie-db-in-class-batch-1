import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import '../../data/vos/actors_vo/actors_vo.dart';
import '../../data/vos/cast_and_crews_vo/cast_vo/cast_vo.dart';
import '../../data/vos/cast_and_crews_vo/crew_vo/crew_vo.dart';
import '../../data/vos/details_vo/details_vo.dart';
import '../../data/vos/details_vo/genre_vo/genre_vo.dart';
import '../../data/vos/genres_vo/genres_vo.dart';

abstract class MovieDataAgent {
  Future<List<MovieVO>?> getNowPlaying(int page);

  Future<int?> getTotalPage(int page);

  Future<List<MovieVO>?> getPopularMovie(int page);

  Future<int?> getShowCaseMovie(int page);

  Future<List<MovieVO>?> getGenresMovie(int withGenres);

  Future<List<MovieVO>?> getSimilarMovie(int page, int movieID);

  Future<List<ActorsVO>?> getActors(int page);

  Future<List<CastVO>?> getCast(int movieID);

  Future<List<CrewVO>?> getCrew(int movieID);

  Future<DetailsVO?> getDetails(int movieID);

  Future<List<GenresVO>?>getGenresIdAndName();

  Future<int?> similarPage (int page,int movieID);

}
