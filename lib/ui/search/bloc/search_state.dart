part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {}

class SearchDefulatScreen extends SearchState {}

class SearchSuccess extends SearchState {
  final SearchEntiry searchEntiry;
  const SearchSuccess(this.searchEntiry);

  @override
  List<Object> get props => [searchEntiry];
}

class SearchFailed extends SearchState {
  final AppeExeption exeption;
  const SearchFailed(this.exeption);

  @override
  List<Object> get props => [exeption];
}
