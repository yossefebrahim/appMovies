import 'package:equatable/equatable.dart';

abstract class TvDetaliesEvent extends Equatable {
  const TvDetaliesEvent();
  @override
  List<Object?> get props => [];
}

class GetTvDetaliesEvent extends TvDetaliesEvent {
  final int id;

  const GetTvDetaliesEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class GetTvDetaliesRecomandationEvent extends TvDetaliesEvent {
  final int id;

  const GetTvDetaliesRecomandationEvent(this.id);
  @override
  List<Object?> get props => [id];
}
