import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/common/exception.dart';
import 'package:movie_series/data/entity/top_rated.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted) {
        emit(HomeLoading());
        await Future.delayed(const Duration(seconds: 2));
        // emit(HomeSucces());
      }
    });
  }
}
