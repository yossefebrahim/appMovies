import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie_detalies_recomandation.dart';

class RecomandationModel extends MovieDetaliesRecomandation {
  const RecomandationModel({
    required super.id,
    super.backdropPath,
  });

  factory RecomandationModel.fromJson(Map<String, dynamic> json) =>
      RecomandationModel(
        id: json["id"],
        backdropPath:
            json["backdrop_path"] ?? "/qQqEq11QsXdSTmYs3M7D5bxFHJg.jpg",
      );
}
