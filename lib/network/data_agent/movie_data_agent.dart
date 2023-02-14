import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';

abstract class MovieDataAgent{
  Future<List<MovieVO>?>getNowPlaying(int page);

  Future<int?>getTotalPage(int page);

  Future<List<MovieVO>?> getPopularMovie(int page);
}