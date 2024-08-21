import 'dart:async';

import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_onTheAir_Tv_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_popular_Tv_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_topRated_Tv_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontroller/tv_event.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontroller/tv_state.dart';
import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnTheAirTvUseCase getOnTheAirTvUseCase;
  final GetPopularTvUseCase getPopularTvUseCase;
  final GetTopRatedTvUseCase getTopRatedTvUseCase;
  TvBloc(
    this.getOnTheAirTvUseCase,
    this.getPopularTvUseCase,
    this.getTopRatedTvUseCase,
  ) : super(const TvState()) {
    on<GetOnTheAirTvEvent>(_getOnTheAirTv);
    on<GetPopularTvEvent>(_getpopularTv);
    on<GetTopRatesTvEvent>(_getTopRated);
  }

  FutureOr<void> _getOnTheAirTv(
      GetOnTheAirTvEvent event, Emitter<TvState> emit) async {
    final result = await getOnTheAirTvUseCase.excute();
    result.fold(
      (l) => emit(state.copywith(
        onTheAirTvMessage: l.message,
        onTheAirTvState: RequestState.Error,
      )),
      (r) => emit(state.copywith(
        onTheAirTv: r,
        onTheAirTvState: RequestState.Loaded,
      )),
    );
  }

  FutureOr<void> _getpopularTv(
      GetPopularTvEvent event, Emitter<TvState> emit) async {
    final result = await getPopularTvUseCase.excute();
    result.fold(
      (l) => emit(
        state.copywith(
          popularTvMessage: l.message,
          popularTvState: RequestState.Error,
        ),
      ),
      (r) => emit(state.copywith(
        popularTv: r,
        popularTvState: RequestState.Loaded,
      )),
    );
  }

  FutureOr<void> _getTopRated(
      GetTopRatesTvEvent event, Emitter<TvState> emit) async {
    final result = await getTopRatedTvUseCase.excute();
    result.fold(
      (l) => emit(state.copywith(
        topRatedTvmessage: l.message,
        topRatedTvState: RequestState.Error,
      )),
      (r) => emit(state.copywith(
        topRatedTv: r,
        topRatedTvState: RequestState.Loaded,
      )),
    );
  }
}
