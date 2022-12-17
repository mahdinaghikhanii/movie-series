import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLoadingService extends StatelessWidget {
  final String imgPath;
  const ImageLoadingService({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
          imageUrl: imgPath,
          progressIndicatorBuilder: (context, url, progress) =>
              const CupertinoActivityIndicator(
                color: Colors.white,
              )),
    );
  }
}
