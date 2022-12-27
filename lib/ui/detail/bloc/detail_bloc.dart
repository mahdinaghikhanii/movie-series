import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/common/exception.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<DetailEvent>((event, emit) {
      if (event is DetailStarted) {
        try {
          emit(DetailLoading());
        } catch (e) {
          emit(DetailFailed(AppeExeption()));
        }
      }
    });
  }
}
