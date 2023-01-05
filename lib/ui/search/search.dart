import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/common/dimensions.dart';
import 'package:movie_series/data/repo/remote/search_movie_repository.dart';
import 'package:movie_series/theme.dart';
import 'package:movie_series/ui/search/bloc/search_bloc.dart';
import 'package:movie_series/ui/widgets/loading.dart';

import '../../common/app_constans.dart';
import '../widgets/custom_appbar.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(iconBack: false, title: "Search"),
        body: BlocProvider(create: ((context) {
          final bloc = SearchBloc(searchMovieRepository);
          bloc.add(StartedSearchMovie());
          return bloc;
        }), child:
            BlocBuilder<SearchBloc, SearchState>(builder: ((context, state) {
          if (state is SearchLoading) {
            return const LoadingWidgets();
          } else if (state is SearchDefulatScreen) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.padingdefultSize),
              child: Column(
                children: [
                  Container(
                    height: 44,
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: LightThemeColor.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 30,
                        )
                      ],
                    ),
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<SearchBloc>(context)
                                .add(RequestForSearchMovie(controller.text));
                          },
                          icon: const Icon(
                            CupertinoIcons.search,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 200),
                  Column(
                    children: [
                      Image.asset("assets/img/search.png"),
                      const SizedBox(height: 20),
                      Text(
                        "Search your movie lover",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is SearchSuccess) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.padingdefultSize),
                  child: Container(
                    height: 44,
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 10, bottom: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: LightThemeColor.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 30,
                        )
                      ],
                    ),
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<SearchBloc>(context)
                                .add(RequestForSearchMovie(controller.text));
                          },
                          icon: const Icon(
                            CupertinoIcons.search,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.padingdefultSize, vertical: 2),
                      itemCount: state.searchEntiry.results.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 95,
                                  height: 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(19),
                                    child: CachedNetworkImage(
                                        errorWidget: (context, url, error) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/img/notfind.png"))),
                                          );
                                        },
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            "${AppConstans.getPoster}${state.searchEntiry.results[index].backdropPath}",
                                        progressIndicatorBuilder: (context, url,
                                                progress) =>
                                            Container(
                                              height: 218,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: const Color(0xFF92929D),
                                            )),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(state
                                        .searchEntiry.results[index].title),
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
                                        Text(state.searchEntiry.results[index]
                                            .voteAverage),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      })),
                )
              ],
            );
          } else if (state is SearchFailed) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.padingdefultSize),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 44,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, bottom: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: LightThemeColor.primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 30,
                          )
                        ],
                      ),
                      child: TextField(
                        controller: controller,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              BlocProvider.of<SearchBloc>(context)
                                  .add(RequestForSearchMovie(controller.text));
                            },
                            icon: const Icon(
                              CupertinoIcons.search,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 180),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/search.png"),
                        const SizedBox(height: 20),
                        Text(
                          "we are sorry, we can\nnot find the movie :(",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Find your movie by Type title,\ncategories, years, etc",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: LightThemeColor.primaryColor,
                                  fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            throw "bad State";
          }
        }))));
  }
}
