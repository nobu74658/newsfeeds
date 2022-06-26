import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageFromUrl extends StatelessWidget {
  final String? imageUrl;

  const ImageFromUrl({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isInvalidUrl = (imageUrl != null) ? imageUrl!.startsWith("http"): false;

    final primaryColor = Theme.of(context).primaryColor;

    if (imageUrl == Null || imageUrl == "" || !isInvalidUrl) {
      return const Icon(Icons.broken_image);
    } else {
      print(imageUrl);
      return CachedNetworkImage(
          imageUrl: imageUrl!,
          placeholder: (context, url) => CircularProgressIndicator(
            color: primaryColor,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.broken_image),
          fit: BoxFit.cover,
      );
    }
  }
}
