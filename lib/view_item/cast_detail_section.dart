import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import '../data/vos/credit_vo/cast_vo.dart';
import '../widgets/easy_actor_widget.dart';
import '../widgets/easy_more_item.dart';

class CastSection extends StatelessWidget {
  const CastSection({
    Key? key,
    required this.cast,
    required this.controller,
  }) : super(key: key);

  final List<CastVO> cast;
  final ScrollController controller;



  @override
  Widget build(BuildContext context) {
    return Container(
      height: dWh280x,
      color: cSecondary,
      child: Column(
        children: [
          const SizedBox(
            height: dMp10x,
          ),
          const EasyMoreItem(
            leftText: 'Actors',
          ),
          const SizedBox(
            height: dMp10x,
          ),
          (cast.isEmpty)
              ? const Center(child: CircularProgressIndicator())
              : EasyActorWidget(controller: controller, knowForActor: cast),
        ],
      ),
    );
  }
}