import 'package:flutter/material.dart';
import 'package:movie_series/common/app_constans.dart';
import 'package:movie_series/ui/widgets/image.dart';

import '../../../common/dimensions.dart';
import '../../../data/entity/reviews.dart';

class ReviewsWidget extends StatelessWidget {
  final ScrollController scrollController;
  final ReviewsEntiry reviewsEntiry;
  const ReviewsWidget(
      {super.key, required this.reviewsEntiry, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return reviewsEntiry.results.isEmpty
        ? Center(
            child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset('assets/img/box.png'),
              const SizedBox(height: 20),
              Text(
                "There is no review",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ))
        : ListView.builder(
            primary: false,
            shrinkWrap: true,
            controller: scrollController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: reviewsEntiry.results.length,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(
              left: Dimensions.padingdefultSize,
            ),
            itemBuilder: ((context, index) {
              final reviewsItem = reviewsEntiry.results[index];

              return SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 55,
                          width: 55,
                          child: ImageLoadingService(
                              imgPath: AppConstans.reviewsAvatar +
                                  reviewsEntiry
                                      .results[index].authorDetails.avatarPath
                                      .toString(),
                              radius: BorderRadius.circular(40),
                              boxFit: BoxFit.cover),
                        ),
                        const SizedBox(height: 8),
                        Text(reviewsItem.authorDetails.rating.toString())
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviewsItem.authorDetails.name.isNotEmpty
                                ? reviewsItem.authorDetails.name
                                : "Anonymus",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 10),
                          Text(reviewsItem.content.toString())
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
