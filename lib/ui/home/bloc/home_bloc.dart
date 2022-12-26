import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/entity/movie_item.dart';
import '../../../data/repo/now_playing_repository.dart';

import '../../../common/exception.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MovieRepository topRatedRepository;
  MovieRepository nowPlayingRepository;
  MovieRepository upComingRepository;
  MovieRepository popularRepository;
  MovieRepository topRatedTabBarRepository;
  HomeBloc(
      this.topRatedRepository,
      this.nowPlayingRepository,
      this.upComingRepository,
      this.popularRepository,
      this.topRatedTabBarRepository)
      : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted) {
        try {
          emit(HomeLoading());
          final topRated = await topRatedRepository.getTopRated(page: 1);
          final topRatedTabBar =
              await topRatedTabBarRepository.getTopRatedTabBar(page: 2);
          final nowPlaying = await nowPlayingRepository.getNowPlaying();
          final upComing = await upComingRepository.getUpCominf();
          final popular = await popularRepository.getPopular();
          emit(HomeSucces(
              topRated, nowPlaying, upComing, popular, topRatedTabBar));
        } catch (e) {
          debugPrint(e.toString());
          emit(HomeFailed(AppeExeption()));
        }
      }
    });
  }
}
