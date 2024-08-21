import 'dart:async';

import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_Tv_detalies_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_Tv_detalies_reacomandation_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontrollerdetalies/tv_detalies_event.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontrollerdetalies/tv_detalies_state.dart';
import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvDetaliesBloc extends Bloc<TvDetaliesEvent, TvDetaliesState> {
  final GetTvDetaliesUseCase getTvDetaliesUseCase;
  final GetTvDetaliesRecomandationUseCase getTvDetaliesRecomandationUseCase;
  TvDetaliesBloc(
    this.getTvDetaliesUseCase,
    this.getTvDetaliesRecomandationUseCase,
  ) : super(const TvDetaliesState()) {
    on<GetTvDetaliesEvent>(_getTvDetalies);
    on<GetTvDetaliesRecomandationEvent>(_getTvRecomandation);
  }

  FutureOr<void> _getTvDetalies(
      GetTvDetaliesEvent event, Emitter<TvDetaliesState> emit) async {
    final result = await getTvDetaliesUseCase
        .excute(GetTvDetaliesParametares(id: event.id));
    result.fold(
      (l) => emit(state.copywith(
        tvDetaliesMessage: l.message,
        tvDetaliesState: RequestState.Error,
      )),
      (r) => emit(state.copywith(
        tvDetalies: r,
        tvDetaliesState: RequestState.Loaded,
      )),
    );
  }

  FutureOr<void> _getTvRecomandation(GetTvDetaliesRecomandationEvent event,
      Emitter<TvDetaliesState> emit) async {
    final result = await getTvDetaliesRecomandationUseCase
        .excute(GetTvRecomandationParametares(id: event.id));
    result.fold(
      (l) => emit(state.copywith(
        tvrecomandationMessage: l.message,
        tvrecomandationState: RequestState.Error,
      )),
      (r) => emit(state.copywith(
        tvrecomandation: r,
        tvrecomandationState: RequestState.Loaded,
      )),
    );
  }
}
