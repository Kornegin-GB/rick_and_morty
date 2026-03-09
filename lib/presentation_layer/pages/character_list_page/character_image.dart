import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => SizedBox(
        width: 160,
        height: 160,
        child: Center(child: CircularProgressIndicator()),
      ),

      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
