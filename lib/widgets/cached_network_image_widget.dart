import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    Key? key,
    required this.imageUrl,
    this.height = 0.0
  }) : super(key: key);

  final String imageUrl;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      imageUrl:imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
      const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
      const Center(child: Icon(Icons.error)),
    );
  }
}
