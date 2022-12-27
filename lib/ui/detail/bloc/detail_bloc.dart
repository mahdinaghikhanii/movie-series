import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/common/exception.dart';
import 'package:movie_series/data/entity/information_movie.dart';

import 'package:movie_series/data/repo/information_movie_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  InformationMovieRepository informationMovieRepository;
  DetailBloc(this.informationMovieRepository) : super(DetailLoading()) {
    on<DetailEvent>((event, emit) async {
      if (event is DetailStarted) {
        try {
          emit(DetailLoading());

          final informationMovie = await informationMovieRepository
              .getInformationMovie(idMovie: event.idMovie.toString());

          emit(DetailSucces(informationMovie));
        } catch (e) {
          emit(DetailFailed(AppeExeption()));
        }
      }
    });
  }
}
