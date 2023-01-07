part of 'whatch_list_bloc.dart';

abstract class WhatchListEvent extends Equatable {
  const WhatchListEvent();

  @override
  List<Object> get props => [];
}

class StartWhatchListEvent extends WhatchListEvent {}

class AddToWhatchListEvent extends WhatchListEvent {
  final ResultItemMovieEntity resultItemMovieEntity;
  const AddToWhatchListEvent(this.resultItemMovieEntity);

  @override
  List<Object> get props => [resultItemMovieEntity];
}

class DeleteWhatchListItem extends WhatchListEvent {
  final int id;
  const DeleteWhatchListItem(this.id);

  @override
  List<Object> get props => [id];
}
