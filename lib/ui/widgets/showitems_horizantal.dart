import 'package:flutter/material.dart';
import 'package:movie_series/ui/detail/detail.dart';

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
          mainAxisExtent: 160,
          crossAxisSpacing: 20),
      itemBuilder: (BuildContext context, int index) {
        debugPrint(nowPlayingItemEntity.resultEntity[index].title);
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => DetailsScreen(
                      itemEntity: nowPlayingItemEntity.resultEntity[index])))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ImageLoadingService(
                  loading: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 140,
                    decoration: BoxDecoration(
                        color: const Color(0xFF92929D),
                        borderRadius: BorderRadius.circular(16)),
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  boxFit: BoxFit.cover,
                  radius: BorderRadius.circular(16),
                  imgPath:
                      "${AppConstans.getPoster}${nowPlayingItemEntity.resultEntity[index].posterPath}"),
            ),
          ),
        );
      },
    );
  }
}
