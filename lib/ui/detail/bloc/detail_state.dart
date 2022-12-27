part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailSucces extends DetailState {
  final InformationMovieEntity informationMovieEntity;
  const DetailSucces(this.informationMovieEntity);

  @override
  List<Object> get props => [informationMovieEntity];
}

class DetailFailed extends DetailState {
  final AppeExeption exeption;
  const DetailFailed(this.exeption);

  @override
  List<Object> get props => [exeption];
}

class DetailLoading extends DetailState {}
