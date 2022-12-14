import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../whatch_list/bloc/whatch_list_bloc.dart';

import 'widgets/about_movie_widgets.dart';
import 'widgets/cast_widgets.dart';
import 'widgets/reviews_vertical_widgets.dart';

import '../../common/dimensions.dart';

import '../../data/entity/resultItem_movie.dart';

import '../../data/repo/remote/cast_movie_repository.dart';
import '../../data/repo/remote/information_movie_repository.dart';
import '../../data/repo/remote/reviews_movie_repository.dart';
import 'bloc/detail_bloc.dart';
import '../widgets/category_movie_information.dart';

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
  late ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
            return BlocProvider(
              create: (BuildContext context) {
                final bloc = WhatchListBloc(whatchListLocalRepository);
                bloc.stream.listen((state) {
                  if (state is SuccessAddToWhatchList) {
                  } else if (state is FailedToAddWhatchList) {}
                });
                return bloc;
              },
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  actions: [
                    BlocProvider(
                      create: (BuildContext context) {
                        final bloc = WhatchListBloc(whatchListLocalRepository);
                        return bloc;
                      },
                      child: BlocBuilder<WhatchListBloc, WhatchListState>(
                        builder: (BuildContext context, state) {
                          return IconButton(
                            onPressed: () {
                              BlocProvider.of<WhatchListBloc>(context)
                                  .add(AddToWhatchListEvent(widget.itemEntity));
                            },
                            icon: const Icon(Icons.bookmark_border),
                            iconSize: 24,
                          );
                        },
                      ),
                    )
                  ],
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 20,
                  ),
                  title: Text("Detail",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 18)),
                ),
                body: ListView(
                    controller: _controller,
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
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
                                      progressIndicatorBuilder:
                                          (context, url, progress) => Container(
                                                height: 218,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
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
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              child: ImageLoadingService(
                                                  boxFit: BoxFit.cover,
                                                  imgPath:
                                                      "${AppConstans.getPoster}${widget.itemEntity.posterPath}",
                                                  radius: BorderRadius.circular(
                                                      16)),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 70),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Icon(Icons.star,
                                              color: Color(0xFFFF8700)),
                                          const SizedBox(width: 4),
                                          Text(
                                            widget.itemEntity.voteAverage
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .copyWith(
                                                    color:
                                                        const Color(0xFFFF8700),
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                    title: time[0],
                                    iconData: Icons.calendar_month),
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: tabController,
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 14),
                                  isScrollable: true,
                                  unselectedLabelColor: Colors.grey,
                                  indicatorPadding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  indicatorColor: const Color(0xFF3A3F47),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicatorWeight: 3,
                                  labelPadding: const EdgeInsets.only(
                                      left: 10,
                                      right: Dimensions.padingdefultSize),
                                  onTap: (val) {},
                                  tabs: const [
                                    Tab(text: "About movie"),
                                    Tab(text: "Reviews"),
                                    Tab(text: "Cast"),
                                  ],
                                )),
                            const SizedBox(height: 20),
                            Expanded(
                              child: TabBarView(
                                  controller: tabController,
                                  children: [
                                    AboutMovieWidgets(
                                        itemEntity: widget.itemEntity),
                                    ReviewsWidget(
                                      reviewsEntiry: state.reviewsEntiry,
                                      scrollController: _controller,
                                    ),
                                    CastWigets(
                                      castMovieEntity: state.castMovieEntity,
                                      scrollController: _controller,
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ]),
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
