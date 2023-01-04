part of 'whatch_list_bloc.dart';

abstract class WhatchListState extends Equatable {
  const WhatchListState();

  @override
  List<Object> get props => [];
}

class WhatchListInitial extends WhatchListState {}

class IsEmptyWhatchList extends WhatchListState {}

class WhatchListSucces extends WhatchListState {
  final List<ResultItemMovieEntity> data;
  const WhatchListSucces(this.data);
  @override
  List<Object> get props => [data];
}

class WhatchListLoading extends WhatchListState {}

class WhatchListFailed extends WhatchListState {
  final AppeExeption exeption;
  const WhatchListFailed(this.exeption);

  @override
  List<Object> get props => [exeption];
}

class SuccessAddToWhatchList extends WhatchListState {}

class FailedToAddWhatchList extends WhatchListState {
  final AppeExeption exeption;
  const FailedToAddWhatchList(this.exeption);

  @override
  List<Object> get props => [exeption];
}
