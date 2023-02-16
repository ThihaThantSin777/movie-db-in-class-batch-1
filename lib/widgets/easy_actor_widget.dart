import 'package:flutter/cupertino.dart';
import 'package:movie_db/constant/api_constant.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import 'easy_cached_network_image.dart';
import 'easy_text_widget.dart';

class EasyActorWidget extends StatelessWidget {
  const EasyActorWidget({
    Key? key, required this.knowForActor,
    required this.controller,
  }) : super(key: key);
  final List knowForActor;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: dWh220x,
      child: ListView.builder(
        itemCount: knowForActor.length,
       scrollDirection: Axis.horizontal,
       itemBuilder: (context, index) {
         return ListViewItem(
           image: knowForActor[index].profilePath ?? "",
           name: knowForActor[index].name ?? "",
           like: knowForActor[index].popularity ?? 0,
         );
       },
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    Key? key,
    required this.image, required this.name, required this.like
  }) : super(key: key);
 final String image;
 final String name;
 final num like;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: dWh160x,
      height: dWh200x,
      margin: const EdgeInsets.only(left: dMp10x,right: dMp5x),
      child: Stack(
        children: [
          EasyCachedImage(imgUrl: image.isEmpty?kDefaultImage:"$kPrefixImageLink$image", height: dWh220x, width: dWh160x),
          Positioned(
            bottom: dMp10x,
            left: dMp5x,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:  [
                EasyTextWidget(data: name,fontSize: dFs14x,),
                Row(
                  children:  [
                    const Icon(CupertinoIcons.hand_thumbsup_fill,color: cAmber,size: dFs14x,),
                    EasyTextWidget(data: "$like m Liked ",fontSize: dFs14x,color: cAmber,),
                  ],
                )
              ],
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Icon(
              CupertinoIcons.heart,
              color: cWhite,
            ),
          ),
        ],
      ),
    );
  }
}