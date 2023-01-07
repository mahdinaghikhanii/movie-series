import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../common/exception.dart';
import '../../../data/entity/resultItem_movie.dart';
import '../../../data/repo/local/whatch_list_local_repository.dart';
import '../../../data/source/local/whatch_list_local_data_source.dart';
import '../../../main.dart';

part 'whatch_list_event.dart';
part 'whatch_list_state.dart';

final whatchListLocalRepository =
    WatchListLocalRepository(WatchListLocalDataSource(Hive.box(taskBoxName)));

class WhatchListBloc extends Bloc<WhatchListEvent, WhatchListState> {
  WatchListLocalRepository repository;
  WhatchListBloc(this.repository) : super(WhatchListLoading()) {
    on<WhatchListEvent>((event, emit) async {
      if (event is StartWhatchListEvent) {
        debugPrint("User Clicked");
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
      } else if (event is DeleteWhatchListItem) {
        try {
          await repository.deleteById(event.id);
          emit(SuccessDeleteWhatchListItem());
          emit(WhatchListLoading());
        } catch (e) {
          emit(FailedDeleteWhatchListItem(AppeExeption()));
        }
      }
    });
  }
}
