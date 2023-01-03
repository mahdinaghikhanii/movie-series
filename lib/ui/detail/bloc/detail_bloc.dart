import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/data/entity/cast_movie.dart';
import 'package:movie_series/data/repo/remote/cast_movie_repository.dart';
import 'package:movie_series/data/repo/remote/information_movie_repository.dart';
import 'package:movie_series/data/repo/remote/reviews_movie_repository.dart';

import '../../../common/exception.dart';
import '../../../data/entity/information_movie.dart';
import '../../../data/entity/reviews.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  InformationMovieRepository informationMovieRepository;
  ReviewsMovieRepository reviewsMovieRepository;
  CastMovieRepository castMovieRepository;
  DetailBloc(this.informationMovieRepository, this.reviewsMovieRepository,
      this.castMovieRepository)
      : super(DetailLoading()) {
    on<DetailEvent>((event, emit) async {
      if (event is DetailStarted) {
        try {
          emit(DetailLoading());

          final informationMovie = await informationMovieRepository
              .getInformationMovie(idMovie: event.idMovie.toString());

          final reviews = await reviewsMovieRepository.getReviews(
              idMovie: event.idMovie.toString());

          final castMovie = await castMovieRepository.getCastMovie(
              idMovie: event.idMovie.toString());

          emit(DetailSucces(informationMovie, reviews, castMovie));
        } catch (e) {
          debugPrint(e.toString());
          emit(DetailFailed(AppeExeption()));
        }
      }
    });
  }
}
