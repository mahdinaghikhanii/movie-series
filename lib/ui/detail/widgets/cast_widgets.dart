import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_series/data/entity/cast_movie.dart';

import '../../../common/app_constans.dart';

class CastWigets extends StatelessWidget {
  final ScrollController scrollController;
  final CastMovieEntity castMovieEntity;
  const CastWigets(
      {super.key,
      required this.castMovieEntity,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0,
              crossAxisSpacing: 24,
              mainAxisExtent: 170,
              crossAxisCount: 2),
          itemCount: castMovieEntity.cast!.length,
          shrinkWrap: true,
          controller: scrollController,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(left: 24),
          itemBuilder: ((context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CachedNetworkImage(
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                            backgroundImage: imageProvider,
                          ),
                      fit: BoxFit.cover,
                      imageUrl: AppConstans.getPoster +
                          castMovieEntity.cast![index].profilePath.toString(),
                      progressIndicatorBuilder: (context, url, progress) =>
                          const CupertinoActivityIndicator(
                            color: Colors.white,
                          )),
                ),
                const SizedBox(height: 10),
                Text(castMovieEntity.cast![index].name.toString())
              ],
            );
          })),
    );
  }
}
