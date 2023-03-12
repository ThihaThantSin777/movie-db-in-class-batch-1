import 'package:flutter/material.dart';
import 'package:movie_db/widgets/image_from_network.dart';

class MovieDetailsImageItemView extends StatelessWidget {
  const MovieDetailsImageItemView({
    super.key,
    required this.imageLink,
  });

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return (imageLink.isEmpty)
        ? const Center(child: CircularProgressIndicator())
        : ImageFromNetwork(image: imageLink);
  }
}
