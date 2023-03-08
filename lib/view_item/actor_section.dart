import 'package:flutter/material.dart';
import 'package:movie_db/bloc/home_page_bloc.dart';
import 'package:movie_db/data/vos/actor_vo/actor_vo.dart';
import 'package:provider/provider.dart';

import '../constant/dimen.dart';
import '../widgets/easy_actor_widget.dart';
import '../widgets/easy_more_item.dart';

class ActorSection extends StatelessWidget {
  const ActorSection({Key? key, required this.knowForActor}) : super(key: key);

  final List<ActorVO> knowForActor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: dWh270x,
      child: Column(
        children: [
          const EasyMoreItem(leftText: "Actors",rightText: "More Actors",),
          const SizedBox(height: dMp10x,),
          knowForActor.isEmpty?const Center(child: CircularProgressIndicator()):EasyActorWidget(knowForActor: knowForActor,controller: context.read<HomePageBloc>().getScrollController4,)
        ],
      ),
    );
  }
}





