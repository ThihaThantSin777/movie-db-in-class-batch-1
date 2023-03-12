import 'package:flutter/material.dart';
import 'package:movie_db/widgets/easy_text_widget.dart';

import '../constant/Strings.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../data/vos/credits_vo/cast_vo/cast_vo.dart';
import 'Actors_Item_view/actors_Item_view.dart';

class MovieDetailsActorsItemView extends StatelessWidget {
  const MovieDetailsActorsItemView({Key? key, required this.castVOList}) : super(key: key);
  final List<CastVO?> castVOList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kDetailsActorsSectionHeight280x,
      color: kAppBarColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EasyTextWidget(text: kDetailsActorsString,fontsize: kFontsize15x,fontWeight: kFontWeightW300x,color: kGreyColor,),

          SizedBox(
            height: kActorsImageViewHeight200x,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (buildContext, index) => Container(
                  margin: const EdgeInsets.only(left: kSP20x),
                  child: Stack(children: [
                    SizedBox(
                      width: kActorsPictureItemViewWidth150x,
                      height: kActorsPictureItemViewHeight200x,
                      child: ActorsPictureView(image: castVOList[index]?.profilePath ?? '',)
                    ),

                        const Positioned(
                           left: kSP120x,

                           child: Icon(
                            Icons.favorite_border,
                            color: kIconsColor,
                        ),
                         )
                    ,
                    Positioned(
                      top: kSP130x,
                        left: kSP5x,
                        child: ActorsNameView(name: castVOList[index]?.name ?? '',)),

                    const Positioned(
                      top: kSP150x,
                        left: kSP5x,
                        child: YouLikedView())

                  ]),
                ) ,
                separatorBuilder: (buildContext, index) => const SizedBox(
                  width: kSP5x,
                ),
                itemCount: castVOList.length,
            ),
          )
        ],
      ),

    );
  }
}
