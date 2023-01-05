part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class StartedSearchMovie extends SearchEvent {}

class RequestForSearchMovie extends SearchEvent {
  final String query;
  const RequestForSearchMovie(this.query);
}
