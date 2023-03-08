import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/dimen.dart';
import '../data/vos/credit_vo/crew_vo.dart';
import '../widgets/easy_actor_widget.dart';
import '../widgets/easy_more_item.dart';

class CrewSection extends StatelessWidget {
  const CrewSection({
    Key? key,
    required this.crew,
    required this.controller,
  }) : super(key: key);

  final List<CrewVO> crew;
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
            leftText: 'Creators',
            rightText: 'More Creators',
          ),
          const SizedBox(
            height: dMp10x,
          ),
          (crew.isEmpty)
              ? const Center(child: CircularProgressIndicator())
              : EasyActorWidget(controller: controller, knowForActor: crew),
        ],
      ),
    );
  }
}