import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLoadingService extends StatelessWidget {
  final String imgPath;
  final BorderRadius radius;
  final Widget? loading;
  final BoxFit boxFit;
  const ImageLoadingService(
      {super.key,
      required this.imgPath,
      this.loading,
      required this.radius,
      required this.boxFit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius,
      child: CachedNetworkImage(
          fit: boxFit,
          imageUrl: imgPath,
          progressIndicatorBuilder: (context, url, progress) =>
              loading ??
              const CupertinoActivityIndicator(
                color: Colors.white,
              )),
    );
  }
}
