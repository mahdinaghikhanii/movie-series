import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/common/app_constans.dart';
import 'package:movie_series/ui/widgets/image.dart';

import '../../common/dimensions.dart';
import '../../data/repo/top_rated_repository.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (BuildContext context) {
        final bloc = HomeBloc(topRatedRepository);
        bloc.add(HomeStarted());
        return bloc;
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, state) {
          if (state is HomeSucces) {
            return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.padingdefultSize),
                            child: Text(
                              "What do you want to watch ?",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      );

                    case 1:
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.30,
                        child: ListView.builder(
                            padding: const EdgeInsets.only(
                                left: Dimensions.padingdefultSize),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.topRated.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: ImageLoadingService(
                                      imgPath:
                                          "${AppConstans.getPoster}${state.topRated[index].posterPath}"));
                            }),
                      );

                    default:
                      return Container();
                  }
                });
          } else if (state is HomeFailed) {
            return Center(
                child: Text(
              state.appeExeption.toString(),
              style: Theme.of(context).textTheme.displayLarge,
            ));
          } else if (state is HomeLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.white,
              ),
            );
          } else {
            throw "bad state";
          }
        },
      ),
    ));
  }
}
