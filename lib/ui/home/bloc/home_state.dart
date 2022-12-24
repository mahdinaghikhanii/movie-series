part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeSucces extends HomeState {
  final List<ResultItemEntity> topRated;
  final List<ResultItemEntity> nowPlaying;
  const HomeSucces(this.topRated, this.nowPlaying);

  @override
  List<Object> get props => [topRated, nowPlaying];
}

class HomeFailed extends HomeState {
  final AppeExeption appeExeption;
  const HomeFailed(this.appeExeption);
  @override
  List<Object> get props => [appeExeption];
}

class HomeLoading extends HomeState {}
