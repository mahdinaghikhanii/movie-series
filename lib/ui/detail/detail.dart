import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/data/repo/cast_movie_repository.dart';
import '../../common/dimensions.dart';

import '../../data/entity/resultItem_movie.dart';
import '../../data/repo/information_movie_repository.dart';
import '../../data/repo/reviews_movie_repository.dart';
import 'bloc/detail_bloc.dart';
import '../widgets/category_movie_information.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/empty_state.dart';
import '../widgets/image.dart';
import '../widgets/loading.dart';

import '../../common/app_constans.dart';

class DetailsScreen extends StatefulWidget {
  final ResultItemMovieEntity itemEntity;

  const DetailsScreen({
    super.key,
    required this.itemEntity,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return BlocProvider(
      create: (BuildContext context) {
        final bloc = DetailBloc(
            informationRepository, reviewsRepository, castMovieRepository);
        bloc.add(DetailStarted(idMovie: widget.itemEntity.id));
        return bloc;
      },
      child: BlocBuilder<DetailBloc, DetailState>(
        builder: (BuildContext context, state) {
          if (state is DetailSucces) {
            final time = widget.itemEntity.releaseDate.split("-");
            return Scaffold(
              appBar: const CustomAppbar(
                iconBack: true,
                title: "Detail",
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.34,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                                fit: BoxFit.contain,
                                imageUrl:
                                    "${AppConstans.getPoster}${widget.itemEntity.backdropPath}",
                                progressIndicatorBuilder: (context, url,
                                        progress) =>
                                    Container(
                                      height: 218,
                                      width: MediaQuery.of(context).size.width,
                                      color: const Color(0xFF92929D),
                                    )),
                            Positioned(
                                right: 0,
                                bottom: 0,
                                top: 145,
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
                                                "${AppConstans.getPoster}${widget.itemEntity.posterPath}",
                                            radius: BorderRadius.circular(16)),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 70),
                                        child: Text(
                                          widget.itemEntity.title,
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
                                )),
                            Positioned(
                                top: 105,
                                left: 0,
                                bottom: 0,
                                right: Dimensions.padingdefultSize,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.star,
                                        color: Color(0xFFFF8700)),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.itemEntity.voteAverage.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              color: const Color(0xFFFF8700),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CategoryMovieInformation(
                              title: time[0], iconData: Icons.calendar_month),
                          const SizedBox(width: 12),
                          Container(
                              width: 2,
                              height: 20,
                              color: const Color(0xFF92929D)),
                          const SizedBox(width: 12),
                          CategoryMovieInformation(
                              title: state.informationMovieEntity.runtime
                                  .toString(),
                              iconData: CupertinoIcons.clock),
                          const SizedBox(width: 12),
                          Container(
                              width: 2,
                              height: 20,
                              color: const Color(0xFF92929D)),
                          const SizedBox(width: 12),
                          CategoryMovieInformation(
                              title: state
                                  .informationMovieEntity.genres![0].name
                                  .toString(),
                              iconData: Icons.movie)
                        ],
                      )),
                      const SizedBox(height: 10),
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 60,
                          width: double.infinity,
                          child: TabBar(
                            controller: tabController,
                            padding: const EdgeInsets.only(top: 0, left: 14),
                            isScrollable: true,
                            unselectedLabelColor: Colors.grey,
                            indicatorPadding:
                                const EdgeInsets.symmetric(horizontal: 0),
                            indicatorColor: const Color(0xFF3A3F47),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 3,
                            labelPadding: const EdgeInsets.only(
                                left: 10, right: Dimensions.padingdefultSize),
                            onTap: (val) {},
                            tabs: const [
                              Tab(text: "About movie"),
                              Tab(text: "Reviews"),
                              Tab(text: "Cast"),
                            ],
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 24, left: 0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child:
                              TabBarView(controller: tabController, children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimensions.padingdefultSize),
                                child: Text(
                                  widget.itemEntity.overview,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )),
                            state.reviewsEntiry.results.isEmpty
                                ? Center(
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 30),
                                        Image.asset('assets/img/box.png'),
                                        const SizedBox(height: 20),
                                        Text(
                                          "There is no review",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        state.reviewsEntiry.results.length,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.only(
                                      left: Dimensions.padingdefultSize,
                                    ),
                                    itemBuilder: ((context, index) {
                                      final reviewsItem =
                                          state.reviewsEntiry.results[index];

                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 55,
                                                  width: 55,
                                                  child: ImageLoadingService(
                                                      imgPath: AppConstans
                                                              .reviewsAvatar +
                                                          state
                                                              .reviewsEntiry
                                                              .results[index]
                                                              .authorDetails
                                                              .avatarPath
                                                              .toString(),
                                                      radius:
                                                          BorderRadius.circular(
                                                              40),
                                                      boxFit: BoxFit.cover),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(reviewsItem
                                                    .authorDetails.rating
                                                    .toString())
                                              ],
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    reviewsItem.authorDetails
                                                            .name.isNotEmpty
                                                        ? reviewsItem
                                                            .authorDetails.name
                                                        : "Anonymus",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(reviewsItem.content
                                                      .toString())
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    })),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 0,
                                          crossAxisSpacing: 24,
                                          mainAxisExtent: 170,
                                          crossAxisCount: 2),
                                  itemCount: state.castMovieEntity.cast!.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(left: 24),
                                  itemBuilder: ((context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: CachedNetworkImage(
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      CircleAvatar(
                                                        backgroundImage:
                                                            imageProvider,
                                                      ),
                                              fit: BoxFit.cover,
                                              imageUrl: AppConstans.getPoster +
                                                  state.castMovieEntity
                                                      .cast![index].profilePath
                                                      .toString(),
                                              progressIndicatorBuilder: (context,
                                                      url, progress) =>
                                                  const CupertinoActivityIndicator(
                                                    color: Colors.white,
                                                  )),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(state
                                            .castMovieEntity.cast![index].name
                                            .toString())
                                      ],
                                    );
                                  })),
                            ),
                          ]))
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is DetailLoading) {
            return const LoadingWidgets();
          } else if (state is DetailFailed) {
            return EmptyState(
                ontap: () {
                  BlocProvider.of<DetailBloc>(context)
                      .add(DetailStarted(idMovie: widget.itemEntity.id));
                },
                appeExeption: state.exeption);
          } else {
            throw "Bad state";
          }
        },
      ),
    );
  }
}
