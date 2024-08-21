import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_show.dart';
import 'package:cleanarcitecturemmoveapp/core/RequsetState/requsetstate.dart';
import 'package:equatable/equatable.dart';

class TvState extends Equatable {
  final List<TvShow> onTheAirTv;
  final RequestState onTheAirTvState;
  final String onTheAirTvMessage;
  final List<TvShow> popularTv;
  final RequestState popularTvState;
  final String popularTvMessage;
  final List<TvShow> topRatedTv;
  final RequestState topRatedTvState;
  final String topRatedTvmessage;

  const TvState({
    this.onTheAirTv = const [],
    this.onTheAirTvState = RequestState.loading,
    this.onTheAirTvMessage = "",
    this.popularTv = const [],
    this.popularTvState = RequestState.loading,
    this.popularTvMessage = "",
    this.topRatedTv = const [],
    this.topRatedTvState = RequestState.loading,
    this.topRatedTvmessage = "",
  });

  TvState copywith({
    List<TvShow>? onTheAirTv,
    RequestState? onTheAirTvState,
    String? onTheAirTvMessage,
    List<TvShow>? popularTv,
    RequestState? popularTvState,
    String? popularTvMessage,
    List<TvShow>? topRatedTv,
    RequestState? topRatedTvState,
    String? topRatedTvmessage,
  }) {
    return TvState(
      onTheAirTv: onTheAirTv ?? this.onTheAirTv,
      onTheAirTvState: onTheAirTvState ?? this.onTheAirTvState,
      onTheAirTvMessage: onTheAirTvMessage ?? this.onTheAirTvMessage,
      popularTv: popularTv ?? this.popularTv,
      popularTvState: popularTvState ?? this.popularTvState,
      popularTvMessage: popularTvMessage ?? this.onTheAirTvMessage,
      topRatedTv: topRatedTv ?? this.topRatedTv,
      topRatedTvState: topRatedTvState ?? this.topRatedTvState,
      topRatedTvmessage: topRatedTvmessage ?? this.topRatedTvmessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        onTheAirTv,
        onTheAirTvState,
        onTheAirTvMessage,
        popularTv,
        popularTvState,
        popularTvMessage,
        topRatedTv,
        topRatedTvState,
        topRatedTvmessage,
      ];
}
