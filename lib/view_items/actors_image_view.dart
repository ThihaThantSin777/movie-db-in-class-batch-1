import 'package:flutter/material.dart';
import '../constant/dimens.dart';
import '../widgets/cached_network_image_widget.dart';

class ActorsImageView extends StatelessWidget {
  const ActorsImageView({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kActorImageHeight,
      width: kActorImageWidth,
      margin: const EdgeInsets.only(left: 15),
      child: CachedNetworkImageWidget(imageUrl: imageUrl),
    );
  }
}
