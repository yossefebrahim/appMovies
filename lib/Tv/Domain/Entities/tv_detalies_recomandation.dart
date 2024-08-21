import 'package:equatable/equatable.dart';

class TvDetaliesRecomandation extends Equatable {
  final int id;
  final String backdropPath;

  const TvDetaliesRecomandation({
    required this.id,
    required this.backdropPath,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
      ];
}
