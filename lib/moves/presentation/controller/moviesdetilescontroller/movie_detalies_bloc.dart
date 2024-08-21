import 'dart:async';

import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_movie_detalies_recomandation_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_movie_detalies_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviesdetilescontroller/movie_detalies_event.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviesdetilescontroller/movie_detalies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetaliesBloc extends Bloc<MovieDetaliesEvent, MovieDetaliesState> {
  final GetMovieDetaliesUseCase getMovieDetaliesUseCase;
  final GetMovieDetaliesRecomandationUseCase
      getMovieDetaliesRecomandationUseCase;
  MovieDetaliesBloc(
    this.getMovieDetaliesUseCase,
    this.getMovieDetaliesRecomandationUseCase,
  ) : super(const MovieDetaliesState()) {
    on<GetMovieDetaliesEvent>(_getmoviedetailes);
    on<GetMovieDetaliesRecomandationEvent>(_getmoviedetailesrecomandation);
  }

  FutureOr<void> _getmoviedetailes(
      GetMovieDetaliesEvent event, Emitter<MovieDetaliesState> emit) async {
    final reslut = await getMovieDetaliesUseCase
        .excute(GetDetaliesParametares(id: event.id));
    reslut.fold(
      (l) => emit(state.copywith(
        movieDetaliesState: RequestState.Error,
        movieDetaliesMessage: l.message,
      )),
      (r) => emit(state.copywith(
        movieDetalies: r,
        movieDetaliesState: RequestState.Loaded,
      )),
    );
  }

  FutureOr<void> _getmoviedetailesrecomandation(
      GetMovieDetaliesRecomandationEvent event,
      Emitter<MovieDetaliesState> emit) async {
    final reslut = await getMovieDetaliesRecomandationUseCase
        .excute(GetDetaliesRecomandationParametares(id: event.id));
    reslut.fold(
      (l) => emit(state.copywith(
        recomandationState: RequestState.Error,
        recomandationMessage: l.message,
      )),
      (r) => emit(state.copywith(
        recomandation: r,
        recomandationState: RequestState.Loaded,
      )),
    );
  }
}
