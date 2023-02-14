import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EasyCachedImage extends StatelessWidget {
  const EasyCachedImage({Key? key,required this.imgUrl, this.width = 0.0, this.height = 0.0}) : super(key: key);
 final String imgUrl;
 final double width;
 final double height;
  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      width: width,
        height: height,
        imageUrl: imgUrl,
      fit: BoxFit.cover,
      placeholder:(context, url) => const Center(child: CircularProgressIndicator(),) ,
    );
  }
}
