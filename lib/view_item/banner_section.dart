import 'package:flutter/material.dart';
import 'package:movie_db/constant/color.dart';
import 'package:movie_db/constant/dimen.dart';
import 'package:movie_db/widgets/easy_cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constant/api_constant.dart';
import '../data/apply/movei_db_apply_impl.dart';
import '../data/apply/movie_db_apply.dart';
import '../data/vos/movie_vo/movie_vo.dart';


class BannerSection extends StatefulWidget {
  const BannerSection({
    Key? key,}) :  super(key: key);


  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final PageController _pageController = PageController();
  final MovieDBApply _movieApply = MovieDBApplyImpl();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dWh220x,
      child: FutureBuilder<List<MovieVO>?>(
        future: _movieApply.getNowPlayingMovies(1),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return const Center(child: CircularProgressIndicator());
          }
          final bannerList = snapshot.data?.take(5).toList();
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BannerItemsView(listBanner: bannerList ?? [],controller: _pageController,),
              const SizedBox(height: dMp3x,),
              PageIndicator(controller: _pageController,bannerList: bannerList ?? [],onDotClicked: (index){
                _pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.bounceIn);
              },),
            ],
          );
        },
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required this.controller, required this.bannerList, required this.onDotClicked,
  }) : super(key: key);

  final PageController controller;
  final List bannerList;
  final Function(int index) onDotClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dMp10x,
      child: SmoothPageIndicator(
        onDotClicked: (index) => onDotClicked(index),
      controller: controller,
      count:  bannerList.length,
      axisDirection: Axis.horizontal,
      effect: const SlideEffect(
          spacing:  dMp8x,
          radius:  dWh12x,
          dotWidth:  dWh12x,
          dotHeight:  dWh12x,
          dotColor:  cGrey,
          activeDotColor:  cAmber,
      ),
      ),
    );
  }
}

class BannerItemsView extends StatelessWidget {
  const BannerItemsView({
    Key? key,
    required this.listBanner, required this.controller,
  }) : super(key: key);
  final List<MovieVO> listBanner;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: listBanner.length,
        itemBuilder: (context, index) {
          return BannerItem(movieVo: listBanner[index],);
      },));
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({
    Key? key, required this.movieVo,
  }) : super(key: key);
  final MovieVO movieVo;
  @override
  Widget build(BuildContext context) {
    final image = movieVo.backdropPath ?? "";
    final title = movieVo.title ?? "";
    return Stack(
      children: [
        Positioned.fill(
            child: EasyCachedImage(
             imgUrl: (image.isEmpty) ? kDefaultImage : '$kPrefixImageLink$image',
            )),
        Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, cPrimary],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            )),
        const Positioned.fill(
            child: Icon(
              Icons.play_circle,
              color: cAmber,
              size: dFs40x,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}