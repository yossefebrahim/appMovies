import 'package:cleanarcitecturemmoveapp/Tv/Data/Model/genres_detalies_tv_model.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_detalies.dart';

class TvDetaliesModel extends TvDetalies {
  const TvDetaliesModel({
    required super.id,
    required super.backdropPath,
    required super.name,
    required super.overview,
    required super.voteAverage,
    // required super.airData,
    required super.genrestv,
  });

  factory TvDetaliesModel.fromJson(Map<String, dynamic> json) =>
      TvDetaliesModel(
        id: json["id"],
        backdropPath: json["backdrop_path"],
        name: json["name"],
        overview: json["overview"],
        voteAverage: json["vote_average"],
        // airData: json["air_date"],
        genrestv: List<GenresTvModel>.from(
            json["genres"].map((x) => GenresTvModel.fromJson(x))),
      );
}
