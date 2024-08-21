import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_show.dart';

class TvModel extends TvShow {
  const TvModel({
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.voteAverage,
    required super.name,
    required super.genreIds,
    required super.firstAirData,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        overview: json["overview"],
        voteAverage: json["vote_average"],
        name: json["name"],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
        firstAirData: json["first_air_date"],
      );
}
