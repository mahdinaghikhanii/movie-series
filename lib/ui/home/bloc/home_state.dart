part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeSucces extends HomeState {
  final MovieItemEntity topRated;
  final MovieItemEntity nowPlaying;
  final MovieItemEntity upComing;
  final MovieItemEntity popular;
  final MovieItemEntity topRatedTabBar;
  const HomeSucces(this.topRated, this.nowPlaying, this.upComing, this.popular,
      this.topRatedTabBar);

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
