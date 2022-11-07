import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/ui/home/bloc/home_bloc.dart';

import '../../common/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (BuildContext context) {
        final bloc = HomeBloc();
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
                          )
                        ],
                      );

                    case 1:
                      return ListView.builder(itemBuilder: (context, index) {
                        return Container();
                      });

                    default:
                      return Container();
                  }
                });
          } else if (state is HomeFailed) {
            return Center(child: Text(state.appeExeption.toString()));
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
