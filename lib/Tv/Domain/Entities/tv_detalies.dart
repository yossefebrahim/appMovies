import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/genres_tv_detalies.dart';
import 'package:equatable/equatable.dart';

class TvDetalies extends Equatable {
  final String backdropPath;
  final List<GenresTv> genrestv;
  final int id;
  final String overview;
  final String name;
  final double voteAverage;
  // final String airData;

  const TvDetalies({
    required this.backdropPath,
    required this.genrestv,
    required this.id,
    required this.overview,
    required this.name,
    required this.voteAverage,
    // required this.airData,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        name,
        overview,
        voteAverage,
        // airData,
        genrestv,
      ];
}
