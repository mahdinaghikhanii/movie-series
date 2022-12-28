import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/common/exception.dart';
import 'package:movie_series/data/entity/information_movie.dart';
import 'package:movie_series/data/entity/reviews.dart';

import 'package:movie_series/data/repo/information_movie_repository.dart';
import 'package:movie_series/data/repo/reviews_movie_repository.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  InformationMovieRepository informationMovieRepository;
  ReviewsMovieRepository reviewsMovieRepository;
  DetailBloc(this.informationMovieRepository, this.reviewsMovieRepository)
      : super(DetailLoading()) {
    on<DetailEvent>((event, emit) async {
      if (event is DetailStarted) {
        try {
          emit(DetailLoading());

          final informationMovie = await informationMovieRepository
              .getInformationMovie(idMovie: event.idMovie.toString());

          final reviews = await reviewsMovieRepository.getReviews(
              idMovie: event.idMovie.toString());

          emit(DetailSucces(informationMovie, reviews));
        } catch (e) {
          debugPrint(e.toString());
          emit(DetailFailed(AppeExeption()));
        }
      }
    });
  }
}
