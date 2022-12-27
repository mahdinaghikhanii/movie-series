import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_series/common/dimensions.dart';
import 'package:movie_series/data/entity/resultItem.dart';
import 'package:movie_series/ui/widgets/custom_appbar.dart';
import 'package:movie_series/ui/widgets/image.dart';

import '../../common/app_constans.dart';

class DetailsScreen extends StatelessWidget {
  final ResultItemEntity itemEntity;

  const DetailsScreen({super.key, required this.itemEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        iconBack: true,
        title: "Detail",
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.38,
            child: Stack(
              children: [
                CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl:
                        "${AppConstans.getPoster}${itemEntity.backdropPath}",
                    progressIndicatorBuilder: (context, url, progress) =>
                        Container(
                          height: 240,
                          width: MediaQuery.of(context).size.width,
                          color: const Color(0xFF92929D),
                        )),
                Positioned(
                    right: 0,
                    bottom: 0,
                    top: 100,
                    left: Dimensions.padingdefultSize,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 130,
                          width: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: ImageLoadingService(
                                boxFit: BoxFit.cover,
                                imgPath:
                                    "${AppConstans.getPoster}${itemEntity.posterPath}",
                                radius: BorderRadius.circular(16)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Text(
                              itemEntity.title,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
