import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_db/constant/api_constant.dart';
import 'package:movie_db/data/apply/movei_db_apply_impl.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/movie_vo/movie_vo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieDBApply movieDBApply = MovieDBApplyImpl();
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  List<MovieVO> bestPopularMoviesList = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    movieDBApply.getNowPlayingMovies(page).then((value) {
      setState(() {
        bestPopularMoviesList = value ?? [];
      });
    });
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        double pixel = _scrollController.position.pixels;
        if (pixel != 0) {
          page++;
          movieDBApply.getNowPlayingMovies(page).then((value) {
            if(value?.isNotEmpty??false){
              final temp=value;
              temp?.forEach((element) {
                bestPopularMoviesList.add(element);
              });
              setState(() {

              });
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
        ],
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Discover',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Banner Section
            SizedBox(
              height: 250,
              child: FutureBuilder<List<MovieVO>?>(
                  future: movieDBApply.getNowPlayingMovies(1),
                  builder: (context, snapShot) {
                    if (snapShot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapShot.hasError) {
                      return const Center(
                        child: Text('Error Occur'),
                      );
                    }
                    final listMovieBanner = snapShot.data?.take(5).toList();
                    return BannerMovieItemView(
                        controller: _pageController,
                        movieList: listMovieBanner ?? []);
                  }),
            ),

            ///Best Popular Movies And Serial Section
            SizedBox(
                height: 300,
                child: (bestPopularMoviesList.isEmpty)?const Center(child: CircularProgressIndicator(),): Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '  Best Popular Movies And Serial'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: BestPopularMoviesAndSerialItemView(
                            controller: _scrollController,
                            listBestPopularMovies: bestPopularMoviesList))
                  ],
                )
            ),

            ///Location Section
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 10),
              padding:const EdgeInsets.only(left: 20,top: 10,right: 20),
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color:const Color.fromRGBO(30, 31, 48, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text('Check Movie Show Time',style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:const [
                      Icon(Icons.location_on_rounded,color: Colors.white,size: 30,)
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                    child: Text('See More',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                  ),
                ],
              ),
            ),

            ///Show Case Section
           SizedBox(
             height: 300,
             child:
             Column(
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                   Text(' Showcase'.toUpperCase(),style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w200),),
                    Text('More Showcase'.toUpperCase(),style: const TextStyle(decoration: TextDecoration.underline,color: Colors.white),),
                 ],
                 ),
                 Container(
                   padding:const EdgeInsets.all(10),
                   child: FutureBuilder<List<MovieVO>?>(
                       future: movieDBApply.getNowPlayingMovies(1),
                       builder: (context, snapShot) {
                         if (snapShot.connectionState == ConnectionState.waiting) {
                           return const Center(
                             child: CircularProgressIndicator(),
                           );
                         }
                         if (snapShot.hasError) {
                           return const Center(
                             child: Text('Error Occur'),
                           );
                         }
                         final listUpcomingMovie = snapShot.data?.toList();
                         return ShowcaseMovieItemView(
                           showcaseMovie: listUpcomingMovie??[],
                           controller: _pageController,);
                       }),
                 ),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}

class ShowcaseMovieItemView extends StatelessWidget{
  const ShowcaseMovieItemView({Key?key,required this.showcaseMovie,required this.controller}):super (key: key);
  final List<MovieVO> showcaseMovie;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return
    SizedBox(
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        controller: controller,
          separatorBuilder: (context,index)=>const SizedBox(width: 10 ,),
          itemCount: showcaseMovie?.length??0,
        itemBuilder: ( context, index)=>ShowcaseView(title: showcaseMovie[index].originalTitle??'', imageUrl: showcaseMovie[index].backdropPath??''),
      ),

    );
  }
}

class ShowcaseView  extends StatelessWidget{
  const ShowcaseView({Key?key,required this.title,required this.imageUrl}):super (key: key);
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: (imageUrl.isEmpty) ? kDefaultImage : '$kPrefixImageLink$imageUrl',
              fit: BoxFit.cover,
              placeholder: (context, string) => const Center(
                child: CircularProgressIndicator(),
              ),
            )),
        const Positioned.fill(
            child: Icon(
              Icons.play_circle,
              color: Colors.amber,
              size: 40,
            )),
           Align(
            alignment: Alignment.bottomLeft,
            child: Text(title,style:const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w200,
            ),),
          ),
      ],
    );
  }

}

class BestPopularMoviesAndSerialItemView extends StatelessWidget {
  const BestPopularMoviesAndSerialItemView({
    super.key,
    required this.controller,
    required this.listBestPopularMovies,
  });

  final List<MovieVO> listBestPopularMovies;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: listBestPopularMovies?.length ?? 0,
      itemBuilder: (context, index) {
        return Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            width: 140,
            child: BestPopularMoviesView(
              movie: listBestPopularMovies[index],
            ));
      },
    );
  }
}

class BestPopularMoviesView extends StatelessWidget {
  const BestPopularMoviesView({Key? key, required this.movie})
      : super(key: key);
  final MovieVO movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        BestPopularMoviesImageView(image: movie.backdropPath ?? ''),
        const SizedBox(
          height: 5,
        ),
        BestPopularMoviesTitleView(title: movie.originalTitle ?? ''),
        const SizedBox(
          height: 5,
        ),
        BestPopularMoviesRateAndRatingBarView(rate: movie.voteAverage ?? 0.0)
      ],
    );
  }
}

class BestPopularMoviesRateAndRatingBarView extends StatelessWidget {
  const BestPopularMoviesRateAndRatingBarView({Key? key, required this.rate})
      : super(key: key);
  final num rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rate.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        RatingBar.builder(
          itemSize: 15,
          initialRating: rate.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            //print(rating);
          },
        )
      ],
    );
  }
}

class BestPopularMoviesTitleView extends StatelessWidget {
  const BestPopularMoviesTitleView({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold));
  }
}

class BestPopularMoviesImageView extends StatelessWidget {
  const BestPopularMoviesImageView({Key? key, required this.image})
      : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CachedNetworkImage(
        imageUrl: (image.isEmpty) ? kDefaultImage : '$kPrefixImageLink$image',
        fit: BoxFit.cover,
        placeholder: (context, string) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class BannerMovieItemView extends StatelessWidget {
  const BannerMovieItemView(
      {Key? key, required this.movieList, required this.controller})
      : super(key: key);
  final List<MovieVO> movieList;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
              controller: controller,
              itemCount: movieList.length,
              itemBuilder: (context, index) => BannerView(
                    title: movieList[index].originalTitle ?? '',
                    image: movieList[index].backdropPath ?? '',
                  )),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: SmoothPageIndicator(
            onDotClicked: (index) {
              controller.animateToPage(index,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            },
            controller: controller,
            count: movieList.length,
            axisDirection: Axis.horizontal,
            effect: const SlideEffect(
                spacing: 8.0,
                radius: 30,
                dotWidth: 15.0,
                dotHeight: 15.0,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.amber),
          ),
        )
      ],
    );
  }
}

class BannerView extends StatelessWidget {
  const BannerView({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: CachedNetworkImage(
          imageUrl: (image.isEmpty) ? kDefaultImage : '$kPrefixImageLink$image',
          fit: BoxFit.cover,
          placeholder: (context, string) => const Center(
            child: CircularProgressIndicator(),
          ),
        )),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        )),
        const Positioned.fill(
            child: Icon(
          Icons.play_circle,
          color: Colors.amber,
          size: 40,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
