part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeSucces extends HomeState {
  final List<TopRatedItemEntity> topRated;
  const HomeSucces(this.topRated);

  @override
  List<Object> get props => [topRated];
}

class HomeFailed extends HomeState {
  final AppeExeption appeExeption;
  const HomeFailed(this.appeExeption);
  @override
  List<Object> get props => [appeExeption];
}

class HomeLoading extends HomeState {}
