import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_series/common/exception.dart';
import 'package:movie_series/data/entity/search.dart';
import 'package:movie_series/data/repo/remote/search_movie_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchMovieRemoteRepository remoteRepository;
  SearchBloc(this.remoteRepository) : super(SearchDefulatScreen()) {
    on<SearchEvent>((event, emit) async {
      if (event is StartedSearchMovie) {
        emit(SearchDefulatScreen());
      }
      if (event is RequestForSearchMovie) {
        try {
          emit(SearchLoading());
          final dataSerchMovieRespone =
              await remoteRepository.getSearch(query: event.query);
          emit(SearchSuccess(dataSerchMovieRespone));
        } catch (e) {
          emit(SearchFailed(AppeExeption()));
        }
      }
    });
  }
}
