import 'package:equatable/equatable.dart';

abstract class MovieDetaliesEvent extends Equatable {
  const MovieDetaliesEvent();
  @override
  List<Object?> get props => [];
}

class GetMovieDetaliesEvent extends MovieDetaliesEvent {
  final int id;

  const GetMovieDetaliesEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class GetMovieDetaliesRecomandationEvent extends MovieDetaliesEvent {
  final int id;

  const GetMovieDetaliesRecomandationEvent(this.id);
  @override
  List<Object?> get props => [id];
}
