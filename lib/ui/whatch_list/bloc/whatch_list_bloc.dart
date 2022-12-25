import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'whatch_list_event.dart';
part 'whatch_list_state.dart';

class WhatchListBloc extends Bloc<WhatchListEvent, WhatchListState> {
  WhatchListBloc() : super(WhatchListInitial()) {
    on<WhatchListEvent>((event, emit) {});
  }
}
