import 'package:flutter/material.dart';
import 'package:movie_db/bloc/home_page_bloc.dart';
import 'package:provider/provider.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import '../data/vos/movie_vo/movie_vo/movie_vo.dart';
import '../widgets/easy_list_view_widget.dart';
import '../widgets/easy_more_item.dart';

class ShowCaseSection extends StatelessWidget {
  const ShowCaseSection({
    Key? key,
 required this.listPopular,
  }) : super(key: key);

  final List<MovieVO> listPopular;

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
            child:  EasyListViewWidget(
                  scrollController: context.read<HomePageBloc>().getScrollController3,
                  movieList: listPopular,
                )
            ),
        ],
      ),
    );
  }
}







