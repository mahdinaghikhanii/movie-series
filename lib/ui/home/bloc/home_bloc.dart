import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/data/repo/now_playing_repository.dart';

import '../../../common/exception.dart';
import '../../../data/entity/resultItem.dart';
import '../../../data/repo/top_rated_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  TopRatedRepository topRatedRepository;
  NowPlayingRepository nowPlayingRepository;
  HomeBloc(this.topRatedRepository, this.nowPlayingRepository)
      : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted) {
        try {
          emit(HomeLoading());
          final topRated = await topRatedRepository.getTopRated();
          final nowPlaying = await nowPlayingRepository.getNowPlaying();
          emit(HomeSucces(topRated, nowPlaying));
        } catch (e) {
          emit(HomeFailed(AppeExeption()));
        }
      }
    });
  }
}
