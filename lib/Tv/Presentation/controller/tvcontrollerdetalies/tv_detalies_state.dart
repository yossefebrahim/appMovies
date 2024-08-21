import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_detalies.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_detalies_recomandation.dart';
import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';

import 'package:equatable/equatable.dart';

class TvDetaliesState extends Equatable {
  final TvDetalies? tvDetalies;
  final String tvDetaliesMessage;
  final RequestState tvDetaliesState;
  final List<TvDetaliesRecomandation> tvrecomandation;
  final String tvrecomandationMessage;
  final RequestState tvrecomandationState;

  const TvDetaliesState({
    this.tvDetalies,
    this.tvDetaliesMessage = "",
    this.tvDetaliesState = RequestState.loading,
    this.tvrecomandation = const [],
    this.tvrecomandationMessage = "",
    this.tvrecomandationState = RequestState.loading,
  });

  TvDetaliesState copywith({
    TvDetalies? tvDetalies,
    String? tvDetaliesMessage,
    RequestState? tvDetaliesState,
    List<TvDetaliesRecomandation>? tvrecomandation,
    String? tvrecomandationMessage,
    RequestState? tvrecomandationState,
  }) {
    return TvDetaliesState(
      tvDetalies: tvDetalies ?? this.tvDetalies,
      tvDetaliesMessage: tvDetaliesMessage ?? this.tvDetaliesMessage,
      tvDetaliesState: tvDetaliesState ?? this.tvDetaliesState,
      tvrecomandation: tvrecomandation ?? this.tvrecomandation,
      tvrecomandationMessage:
          tvrecomandationMessage ?? this.tvrecomandationMessage,
      tvrecomandationState: tvrecomandationState ?? this.tvrecomandationState,
    );
  }

  @override
  List<Object?> get props => [
        tvDetalies,
        tvDetaliesMessage,
        tvDetaliesState,
        tvrecomandation,
        tvrecomandationMessage,
        tvrecomandationState,
      ];
}
