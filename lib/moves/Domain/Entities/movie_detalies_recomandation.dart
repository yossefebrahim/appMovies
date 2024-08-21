import 'package:equatable/equatable.dart';

class MovieDetaliesRecomandation extends Equatable {
  final int id;
  final String? backdropPath;

  const MovieDetaliesRecomandation({
    required this.id,
    this.backdropPath,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
      ];
}
