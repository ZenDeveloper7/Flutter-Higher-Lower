import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomImage extends StatelessWidget {
  final String image;
  final double height;

  const CustomImage({Key? key, required this.image, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 2,
      child: ColorFiltered(
        colorFilter:
        ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
        child: Image(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            image,
          ),
        ),
      ),
    );
  }
}