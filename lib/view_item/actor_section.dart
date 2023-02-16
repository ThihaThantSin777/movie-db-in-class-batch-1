import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/data/apply/movie_db_apply.dart';
import 'package:movie_db/data/vos/actor_vo/actor_vo.dart';

import '../constant/dimen.dart';
import '../data/apply/movei_db_apply_impl.dart';
import '../widgets/easy_actor_widget.dart';
import '../widgets/easy_more_item.dart';

class ActorSection extends StatefulWidget {
  const ActorSection({Key? key}) : super(key: key);

  @override
  State<ActorSection> createState() => _ActorSectionState();
}

class _ActorSectionState extends State<ActorSection> {
  final MovieDBApply _movieDBApply = MovieDBApplyImpl();
  final ScrollController _scrollController = ScrollController();
  List<ActorVO> knowForActor = [];
  int page = 1;
  @override
  void initState() {
    super.initState();
    _movieDBApply.getKnowForActor(page).then((value) {
      setState(() {
        knowForActor = value ?? [];
      });
    });
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        double pixel = _scrollController.position.pixels;
        if (pixel != 0) {
          page++;
          _movieDBApply.getKnowForActor(page).then((value) {
            if(value?.isNotEmpty??false){
              final temp=value;
              temp?.forEach((element) {
                knowForActor.add(element);
              });
              setState(() {
              });
            }
          });
        }
      }
    }
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: dWh270x,
      child: Column(
        children: [
          const EasyMoreItem(leftText: "Actors",rightText: "More Actors",),
          const SizedBox(height: dMp10x,),
          EasyActorWidget(knowForActor: knowForActor,controller: _scrollController,)
        ],
      ),
    );
  }
}



