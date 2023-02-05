import 'package:flutter/material.dart';
import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/data/apply/movei_db_apply_impl.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieDBApply movieDBApply = MovieDBApplyImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Discover', style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: FutureBuilder<List<MovieVO>?>(
                  future: movieDBApply.getNowPlayingMovies(1),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if (snapShot.hasError) {
                      return Center(child: Text('Error Occur'),);
                    }
                    final listMovieBanner = snapShot.data?.take(5).toList();
                    return PageView.builder(
                        itemCount: listMovieBanner?.length,
                        itemBuilder: (context, index) =>
                            BannerMovieItemView(
                                movieVO: listMovieBanner?[index])
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BannerMovieItemView extends StatelessWidget {
  const BannerMovieItemView({Key? key, required this.movieVO})
      : super(key: key);
  final MovieVO ? movieVO;

  @override
  Widget build(BuildContext context) {
    var image = movieVO?.backdropPath ?? '';
    return Image.network('$kPrefixImageLink$image');
  }
}

