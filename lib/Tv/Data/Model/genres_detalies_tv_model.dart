import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/genres_tv_detalies.dart';

class GenresTvModel extends GenresTv {
  const GenresTvModel({
    required super.id,
    required super.name,
  });
  factory GenresTvModel.fromJson(Map<String, dynamic> json) => GenresTvModel(
        id: json["id"],
        name: json["name"],
      );
}
