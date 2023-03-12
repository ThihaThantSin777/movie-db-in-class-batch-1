import 'package:flutter/material.dart';
import 'package:movie_db/widgets/easy_text_widget.dart';

import '../constant/Strings.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../data/vos/credits_vo/crew_vo/crew_vo.dart';
import 'Actors_Item_view/actors_Item_view.dart';

class MovieDetailsCrewsItemView extends StatelessWidget {
  const MovieDetailsCrewsItemView({Key? key, required this.crewVOList}) : super(key: key);
  final List<CrewVO?> crewVOList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kMovieDetailsCrewsItemViewHeight335x,
      color: kAppBarColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kSP10x,),
          Row(children:const [
            EasyTextWidget(
      text: kCreatorsString,
        color: kGreyColor,
        fontsize: kFontsize15x,fontWeight: kFontWeightW300x,),
            Spacer(),
            EasyTextWidget(
              text: kMoreCreatorsString,
              fontsize: kFontsize15x,
              color: kGreyColor,
              fontWeight: kFontWeightW300x,
              decoration: TextDecoration.underline,
            ),

          ],
          ),
          const SizedBox(height: kSP5x),


          SizedBox(
            width: kWidthInfinity,
            height: kDetailsCreatorsSizedBoxHeight280x,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(
                  height: kSP20x,
                ),
                SizedBox(
                  height: kMovieDetailsActorsPictureViewHeight200x,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (buildContext, index) => Container(
                      margin: const EdgeInsets.only(left: kSP20x),

                      child: Stack(children: [
                        SizedBox(
                            width: kMovieDetailsActorsPictureViewWidth150x,
                            height: kMovieDetailsActorsPictureViewHeight200x,
                            child: ActorsPictureView(image: crewVOList[index]?.profilePath ?? '',)
                        ),

                        const Positioned(
                          left: kSP120x,
                            child: Icon(
                              Icons.favorite_border,
                              color: kIconsColor,
                            )
                        ) ,
                        Positioned(
                            top: kSP130x,
                            child: ActorsNameView(
                              name: crewVOList[index]?.name ?? '',
                            )),
                        const Positioned(top: kSP150x, child: YouLikedView()),
                      ]),
                    ) ,
                    separatorBuilder: (buildContext, index) => const SizedBox(
                      width: kSP5x,
                    ),
                    itemCount: crewVOList.length,
                  ),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}
