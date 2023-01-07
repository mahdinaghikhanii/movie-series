import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/common/dimensions.dart';
import 'package:movie_series/ui/detail/detail.dart';
import 'package:movie_series/ui/widgets/delete_item.dart';
import 'package:provider/provider.dart';

import '../../common/app_constans.dart';
import '../../data/repo/local/whatch_list_local_repository.dart';
import 'bloc/whatch_list_bloc.dart';
import '../widgets/loading.dart';

import '../../theme.dart';
import '../widgets/custom_appbar.dart';

class WhatchListScreen extends StatelessWidget {
  const WhatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
            ontapAction: () {},
            showAction: true,
            iconBack: false,
            title: "Watch list",
            actionIcon: Icons.delete),
        body: BlocProvider(
          create: (BuildContext context) {
            final bloc = WhatchListBloc(whatchListLocalRepository);
            bloc.add(StartWhatchListEvent());
            return bloc;
          },
          child: Consumer<WatchListLocalRepository>(
            builder: (BuildContext context, value, Widget? child) {
              context.read<WhatchListBloc>().add(StartWhatchListEvent());
              return BlocBuilder<WhatchListBloc, WhatchListState>(
                  builder: ((context, state) {
                if (state is WhatchListLoading) {
                  return const LoadingWidgets();
                } else if (state is IsEmptyWhatchList) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/img/box.png"),
                      const SizedBox(height: 20),
                      Text(
                        "There is no movie yet!",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Find your movie by Type title,\ncategories, years, etc",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: LightThemeColor.primaryColor, fontSize: 14),
                      )
                    ],
                  ));
                } else if (state is WhatchListSucces) {
                  return Column(
                    children: [
                      const SizedBox(height: 18),
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.padingdefultSize,
                                vertical: 2),
                            itemCount: state.data.length,
                            itemBuilder: ((context, index) {
                              final time =
                                  state.data[index].releaseDate.split("-");
                              return Dismissible(
                                background: const DeleteItemAnimation(),
                                key: Key(state.data[index].title),
                                onDismissed: (direction) {
                                  BlocProvider.of<WhatchListBloc>(context).add(
                                      DeleteWhatchListItem(
                                          state.data[index].id));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 24),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  DetailsScreen(
                                                      itemEntity:
                                                          state.data[index]))));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 95,
                                          height: 120,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(19),
                                            child: CachedNetworkImage(
                                                errorWidget:
                                                    (context, url, error) {
                                                  return Container(
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: AssetImage(
                                                                "assets/img/notfind.png"))),
                                                  );
                                                },
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                    "${AppConstans.getPoster}${state.data[index].backdropPath}",
                                                progressIndicatorBuilder:
                                                    (context, url, progress) =>
                                                        Container(
                                                          height: 218,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          color: const Color(
                                                              0xFF92929D),
                                                        )),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.data[index].title,
                                                maxLines: 2,
                                              ),
                                              const SizedBox(height: 14),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(Icons.star_outline,
                                                      color: Color(0xFFFF8700)),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    state.data[index]
                                                        .voteAverage,
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xFFFF8700)),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.movie,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(time[0].toString(),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      )),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.language,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                      state.data[index]
                                                          .originalLanguage
                                                          .toString(),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                      )
                    ],
                  );
                } else {
                  throw "Bad state";
                }
              }));
            },
          ),
        ));
  }
}
