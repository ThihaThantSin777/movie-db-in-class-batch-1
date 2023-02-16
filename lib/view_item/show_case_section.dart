import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import '../constant/string.dart';
import '../data/apply/movie_db_apply.dart';
import '../data/vos/movie_vo/movie_vo/movie_vo.dart';
import '../widgets/easy_list_view_widget.dart';
import '../widgets/easy_more_item.dart';

class ShowCaseSection extends StatefulWidget {
  const ShowCaseSection({
    Key? key,
    required this.movieDBApply,
  }) : super(key: key);

  final MovieDBApply movieDBApply;

  @override
  State<ShowCaseSection> createState() => _ShowCaseSectionState();
}

class _ShowCaseSectionState extends State<ShowCaseSection> {
  ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: cSecondary,
      height: dWh260x,
      child: Column(
        children: [
          const SizedBox(height: dMp10x,),
          // title of the showcase
          const EasyMoreItem(leftText: "ShowCases",rightText: 'More ShowCases',),
          const SizedBox(
            height: dMp10x,
          ),
          // popular movies showcase
          SizedBox(
            height: dWh200x,
            child: FutureBuilder<List<MovieVO>?>(
              future: widget.movieDBApply.getPopularMovie(1),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(sErrorMessage),
                  );
                }
                final listPopular = snapshot.data;
                return EasyListViewWidget(
                  scrollController: scrollController,
                  movieList: listPopular ?? [],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}




