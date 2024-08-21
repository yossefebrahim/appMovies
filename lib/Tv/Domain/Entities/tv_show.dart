import 'package:equatable/equatable.dart';

class TvShow extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final double voteAverage;
  final String name;
  final List<int> genreIds;
  final String firstAirData;

  const TvShow({
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.voteAverage,
    required this.name,
    required this.genreIds,
    required this.firstAirData,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        voteAverage,
        name,
        genreIds,
        firstAirData,
      ];
}
