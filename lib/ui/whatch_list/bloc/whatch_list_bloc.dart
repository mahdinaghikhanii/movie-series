import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_series/common/exception.dart';
import 'package:movie_series/data/entity/resultItem_movie.dart';
import 'package:movie_series/data/repo/local/whatch_list_local_repository.dart';
import 'package:movie_series/data/source/local/whatch_list_local_data_source.dart';
import 'package:movie_series/main.dart';

part 'whatch_list_event.dart';
part 'whatch_list_state.dart';

final whatchListLocalRepository =
    WatchListLocalRepository(WatchListLocalDataSource(Hive.box(taskBoxName)));

class WhatchListBloc extends Bloc<WhatchListEvent, WhatchListState> {
  WatchListLocalRepository repository;
  WhatchListBloc(this.repository) : super(WhatchListLoading()) {
    on<WhatchListEvent>((event, emit) async {
      if (event is StartWhatchListEvent) {
        try {
          emit(WhatchListLoading());
          await Future.delayed(const Duration(seconds: 1));
          final item = await repository.getAll();
          if (item.isEmpty) {
            emit(IsEmptyWhatchList());
          } else {
            emit(WhatchListSucces(item));
          }
        } catch (e) {
          emit(WhatchListFailed(AppeExeption()));
        }
      } else if (event is AddToWhatchListEvent) {
        try {
          await repository.createOrUpdate(event.resultItemMovieEntity);
          emit(SuccessAddToWhatchList());
        } catch (e) {
          emit(FailedToAddWhatchList(AppeExeption()));
        }
      }
    });
  }
}
