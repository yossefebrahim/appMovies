import 'package:equatable/equatable.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();
  @override
  List<Object?> get props => [];
}

class GetOnTheAirTvEvent extends TvEvent {}

class GetPopularTvEvent extends TvEvent {}

class GetTopRatesTvEvent extends TvEvent {}
