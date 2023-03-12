import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant/api_constant.dart';

class ImageFromNetwork extends StatelessWidget {
  ImageFromNetwork({Key? key,required this.image}) : super(key: key);
  var image;
  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
      imageUrl: (image.isEmpty) ? kDefaultImage : '$kPrefixImageLink$image',
      fit: BoxFit.cover,
      placeholder: (context, string) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
