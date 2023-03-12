import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/Strings.dart';
import '../../constant/colors.dart';
import '../../constant/dimes.dart';
import '../../data/apply/movie_db_apply.dart';
import '../../data/apply/movie_db_apply_impl.dart';
import '../../data/vos/result_vo/result_vo.dart';
import '../../widgets/easy_text_widget.dart';
import '../../widgets/image_from_network.dart';

///ActorsImageItemView
class ActorsImageItemView extends StatelessWidget {
  const ActorsImageItemView({Key? key,required this.actorsList,required this.scrollController}) : super(key: key);

 final List<ResultsVO> actorsList;
 final ScrollController scrollController;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kActorsSectionHeight300x,
      child: (actorsList.isEmpty)
          ? const Center(
          child: CircularProgressIndicator()
      )
          : Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: kSP20x,
          ),
          Row(children: const [
            EasyTextWidget(text: kActorsString,fontsize: 14,),

            Spacer(),
            EasyTextWidget(text: kMoreActorsString,fontsize: kFontsize14x,fontWeight: kFontWeightBold,decoration: TextDecoration.underline,)

          ]),
          const SizedBox(
            height: kSP20x,
          ),
          ActorsImageView(
            resultsVOList: actorsList,
            scrollController: scrollController,
          )
        ],
      ),
    );
  }
}

///ActorsImageView
class ActorsImageView extends StatelessWidget {
  const ActorsImageView(
      {Key? key, required this.resultsVOList, required this.scrollController})
      : super(key: key);
  final List<ResultsVO> resultsVOList;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: kActorsImageViewHeight200x,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: resultsVOList?.length ?? 0,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(right: kSP5x, left: kSP5x),
          width: kActorsPictureItemViewWidth150x,
          child: ActorsPictureItemView(
            actors: resultsVOList[index],
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: kSP10x,
        ),
      ),
    );
  }
}

/// ActorsPictureItemView
class ActorsPictureItemView extends StatelessWidget {
  const ActorsPictureItemView({Key? key, required this.actors})
      : super(key: key);
  final ResultsVO actors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ActorsPictureView(
          image: actors.profilePath ?? '',
        ),
        const Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            )),
        Positioned(
            top: kSP130x,
            child: ActorsNameView(
              name: actors.name ?? '',
            )),
        const Positioned(top: kSP150x, child: YouLikedView()),
      ],
    );


  }
}

/// ActorsPictureView
class ActorsPictureView extends StatelessWidget {
  const ActorsPictureView({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: kActorsPictureItemViewWidth150x,
        child: ImageFromNetwork(image: image,),

      )
    ;
  }
}

/// ActorsNameView
class ActorsNameView extends StatelessWidget {
  const ActorsNameView({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const EdgeInsets.only(left: kSP5x),
        height: kActorsNameContainerHeight50x,
        child: EasyTextWidget(text: name,fontsize: kFontsize14x,fontWeight: kFontWeightBold,)

    );
  }
}

/// YouLikedView
class YouLikedView extends StatelessWidget {
  const YouLikedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kActorsNameContainerHeight50x,
      child: Row(
        children: const [
          SizedBox(
            width: kSP10x,
          ),
          Icon(
            Icons.thumb_up,
            color: kPlayButtonColor,
            size: kLikedIconSize,
          ),
          EasyTextWidget(text: kYouLikedString,color: kGreyColor,fontsize: kFontSize12x,)

        ],
      ),
    );
  }
}
