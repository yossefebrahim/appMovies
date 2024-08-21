import 'dart:async';

import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_now_playing_movie_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_popular_movies_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_toprated_movies_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_event.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(
    this.getNowPlayingMovieUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>(_getnowplaying);
    on<GetPopularMoviesEvent>(_getpopular);
    on<GetTopRatedEvent>(_gettoprated);
  }

  FutureOr<void> _getnowplaying(
      GetNowPlayingMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMovieUseCase.excute();

    result.fold(
      (l) => emit(state.copywith(
        nowPlayingState: RequestState.Error,
        nowPlayingMessage: l.message,
      )),
      (r) => emit(state.copywith(
        nowPlayingMovies: r,
        nowPlayingState: RequestState.Loaded,
      )),
    );
  }

  FutureOr<void> _getpopular(
      GetPopularMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getPopularMoviesUseCase.excute();

    result.fold(
        (l) => emit(state.copywith(
              popularMessage: l.message,
              popularState: RequestState.Error,
            )),
        (r) => emit(state.copywith(
              popularMovies: r,
              popularState: RequestState.Loaded,
            )));
  }

  FutureOr<void> _gettoprated(
      GetTopRatedEvent event, Emitter<MovieState> emit) async {
    final reslut = await getTopRatedMoviesUseCase.excute();

    reslut.fold(
      (l) => emit(state.copywith(
        topratedMessage: l.message,
        topratedState: RequestState.Error,
      )),
      (r) => emit(state.copywith(
          topratedMovies: r, topratedState: RequestState.Loaded)),
    );
  }
}
