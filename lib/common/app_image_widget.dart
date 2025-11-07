import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImageWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit fit;
  const AppNetworkImageWidget({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: image,
        fit: fit,
        errorWidget: (context, error, stackTrace) => const SizedBox.shrink(),
      ),
    );
  }
}
