import 'package:flutter/material.dart';

import '../../common/app_constans.dart';
import '../../common/dimensions.dart';
import '../../data/entity/movie_item.dart';
import 'image.dart';

class ShowItemsHorizantal extends StatelessWidget {
  final MovieItemEntity nowPlayingItemEntity;
  const ShowItemsHorizantal({super.key, required this.nowPlayingItemEntity});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: nowPlayingItemEntity.resultEntity.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: Dimensions.padingdefultSize),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          mainAxisExtent: 155,
          crossAxisSpacing: 20),
      itemBuilder: (BuildContext context, int index) {
        debugPrint(nowPlayingItemEntity.resultEntity[index].title);
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ImageLoadingService(
              boxFit: BoxFit.contain,
              radius: BorderRadius.circular(16),
              imgPath:
                  "${AppConstans.getPoster}${nowPlayingItemEntity.resultEntity[index].posterPath}"),
        );
      },
    );
  }
}
