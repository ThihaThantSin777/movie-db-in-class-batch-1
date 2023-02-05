
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db/network/data_agent/movie_data_agent.dart';
import 'package:movie_db/network/data_agent/movie_data_agent_impl.dart';

class MovieDBApplyImpl extends MovieDBApply{

  MovieDBApplyImpl._();

  static final MovieDBApplyImpl _singleton=MovieDBApplyImpl._();

  factory MovieDBApplyImpl()=>_singleton;

  final MovieDataAgent _movieDataAgent=MovieDataAgentImpl();

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) =>_movieDataAgent.getNowPlaying(page).then((value) {

    final temp=value?.map((e) {
      e.isGetNowPlaying=true;
      return e;
    }).toList();
    return temp;
  });

}