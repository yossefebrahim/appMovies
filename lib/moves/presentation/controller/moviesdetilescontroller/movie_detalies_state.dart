import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie_detalies.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie_detalies_recomandation.dart';
import 'package:equatable/equatable.dart';

class MovieDetaliesState extends Equatable {
  final String movieDetaliesMessage;
  final RequestState movieDetaliesState;
  final MovieDetalies? movieDetalies;
  final String recomandationMessage;
  final RequestState recomandationState;
  final List<MovieDetaliesRecomandation> recomandation;

  const MovieDetaliesState({
    this.movieDetaliesMessage = '',
    this.movieDetaliesState = RequestState.loading,
    this.movieDetalies,
    this.recomandationMessage = "",
    this.recomandationState = RequestState.loading,
    this.recomandation = const [],
  });

  MovieDetaliesState copywith({
    String? movieDetaliesMessage,
    RequestState? movieDetaliesState,
    MovieDetalies? movieDetalies,
    String? recomandationMessage,
    RequestState? recomandationState,
    List<MovieDetaliesRecomandation>? recomandation,
  }) {
    return MovieDetaliesState(
      movieDetaliesMessage: movieDetaliesMessage ?? this.movieDetaliesMessage,
      movieDetaliesState: movieDetaliesState ?? this.movieDetaliesState,
      movieDetalies: movieDetalies ?? this.movieDetalies,
      recomandationMessage: recomandationMessage ?? this.recomandationMessage,
      recomandationState: recomandationState ?? this.movieDetaliesState,
      recomandation: recomandation ?? this.recomandation,
    );
  }

  @override
  List<Object?> get props => [
        movieDetaliesMessage,
        movieDetaliesState,
        movieDetalies,
        recomandationMessage,
        recomandationState,
        recomandation,
      ];
}
