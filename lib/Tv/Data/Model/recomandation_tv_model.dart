import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_detalies_recomandation.dart';

class RecomandationTvModel extends TvDetaliesRecomandation {
  const RecomandationTvModel({
    required super.id,
    required super.backdropPath,
  });

  factory RecomandationTvModel.fromJson(Map<String, dynamic> json) =>
      RecomandationTvModel(
        id: json["id"],
        backdropPath: json["backdrop_path"],
      );
}
