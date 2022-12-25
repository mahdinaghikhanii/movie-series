import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/ui/widgets/loading.dart';
import '../../data/repo/now_playing_repository.dart';
import '../../common/app_constans.dart';
import '../../common/dimensions.dart';
import '../../data/repo/top_rated_repository.dart';
import '../widgets/image.dart';
import '../widgets/showitems_horizantal.dart';
import 'bloc/home_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
        body: BlocProvider(
      create: (BuildContext context) {
        final bloc = HomeBloc(topRatedRepository, nowPlayingRepository);
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
                          const SizedBox(height: 30),
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
                                  padding: const EdgeInsets.only(right: 20),
                                  child: ImageLoadingService(
                                      imgPath:
                                          "${AppConstans.getPoster}${state.topRated[index].posterPath}"));
                            }),
                      );

                    case 2:
                      return Container(
                          margin: const EdgeInsets.only(top: 26),
                          height: 60,
                          width: double.infinity,
                          child: TabBar(
                            padding: const EdgeInsets.only(
                                top: 0, left: Dimensions.padingdefultSize),
                            isScrollable: true,
                            unselectedLabelColor: Colors.grey,
                            indicatorPadding:
                                const EdgeInsets.symmetric(horizontal: 0),
                            indicatorColor: const Color(0xFF3A3F47),
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 5,
                            labelPadding: const EdgeInsets.only(
                                left: Dimensions.padingdefultSize,
                                right: Dimensions.padingdefultSize),
                            controller: tabController,
                            onTap: (val) {},
                            tabs: const [
                              Tab(text: "Now playing"),
                              Tab(text: "Upcoming"),
                              Tab(text: "Top rated"),
                              Tab(text: "Popular"),
                            ],
                          ));

                    case 3:
                      return Container(
                        margin: const EdgeInsets.only(top: 24, left: 0),
                        width: MediaQuery.of(context).size.width,
                        height: 450,
                        child: TabBarView(controller: tabController, children: [
                          ShowItemsHorizantal(
                              nowPlayingItemEntity: state.nowPlaying),
                          ShowItemsHorizantal(
                              nowPlayingItemEntity: state.nowPlaying),
                          Text(
                            "sssdsadasdajs",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "sdiasjdsadjasidsa",
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ]),
                      );
                    case 4:
                      return SizedBox(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                      );

                    default:
                      return Container();
                  }
                });
          } else if (state is HomeFailed) {
            return Center(
                child: Text(
              state.appeExeption.exception.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ));
          } else if (state is HomeLoading) {
            return const LoadingWidgets();
          } else {
            throw "bad state";
          }
        },
      ),
    ));
  }
}
