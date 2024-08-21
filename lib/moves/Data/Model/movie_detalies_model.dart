import 'package:cleanarcitecturemmoveapp/moves/Data/Model/genres_model.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie_detalies.dart';

class MovieDetaliesModel extends MovieDetalies {
  const MovieDetaliesModel({
    required super.id,
    required super.genres,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.runTime,
  });

  factory MovieDetaliesModel.fromJson(Map<String, dynamic> json) =>
      MovieDetaliesModel(
        id: json['id'],
        genres: List<GenresModel>.from(
            json["genres"].map((x) => GenresModel.fromJson(x))),
        backdropPath: json["backdrop_path"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        title: json["title"],
        voteAverage: json["vote_average"],
        runTime: json["runtime"],
      );
}
