part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class DetailStarted extends DetailEvent {
  final int idMovie;
  const DetailStarted({required this.idMovie});
}

class DetailRefresh extends DetailEvent {
  final int idMovie;
  const DetailRefresh({required this.idMovie});
}
