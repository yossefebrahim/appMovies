import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie.dart';
import 'package:equatable/equatable.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final String nowPlayingMessage;
  final RequestState nowPlayingState;
  final List<Movie> popularMovies;
  final String popularMessage;
  final RequestState popularState;
  final List<Movie> topratedMovies;
  final String topratedMessage;
  final RequestState topratedState;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMessage = "",
    this.nowPlayingState = RequestState.loading,
    this.popularMovies = const [],
    this.popularMessage = "",
    this.popularState = RequestState.loading,
    this.topratedMovies = const [],
    this.topratedMessage = "",
    this.topratedState = RequestState.loading,
  });

  MovieState copywith({
    List<Movie>? nowPlayingMovies,
    String? nowPlayingMessage,
    RequestState? nowPlayingState,
    List<Movie>? popularMovies,
    String? popularMessage,
    RequestState? popularState,
    List<Movie>? topratedMovies,
    String? topratedMessage,
    RequestState? topratedState,
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMessage: popularMessage ?? this.popularMessage,
      popularState: popularState ?? this.popularState,
      topratedMovies: topratedMovies ?? this.topratedMovies,
      topratedMessage: topratedMessage ?? this.topratedMessage,
      topratedState: topratedState ?? this.topratedState,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMessage,
        nowPlayingState,
        popularMovies,
        popularMessage,
        popularState,
        topratedMovies,
        topratedMessage,
        topratedState,
      ];
}
