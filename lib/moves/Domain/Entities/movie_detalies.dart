import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/genres.dart';
import 'package:equatable/equatable.dart';

class MovieDetalies extends Equatable {
  final int id;
  final List<Genres> genres;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int runTime;

  const MovieDetalies({
    required this.id,
    required this.genres,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.runTime,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        releaseDate,
        title,
        voteAverage,
        genres,
        runTime,
      ];
}
