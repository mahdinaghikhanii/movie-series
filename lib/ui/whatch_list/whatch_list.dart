import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_series/ui/whatch_list/bloc/whatch_list_bloc.dart';
import 'package:movie_series/ui/widgets/loading.dart';

import '../../theme.dart';
import '../widgets/custom_appbar.dart';

class WhatchListScreen extends StatelessWidget {
  const WhatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(iconBack: false, title: "Watch list"),
        body: BlocProvider(
          create: (BuildContext context) {
            final bloc = WhatchListBloc(whatchListLocalRepository);
            bloc.add(StartWhatchListEvent());
            return bloc;
          },
          child: BlocBuilder<WhatchListBloc, WhatchListState>(
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
              return Container();
            } else {
              throw "Bad state";
            }
          })),
        ));
  }
}
