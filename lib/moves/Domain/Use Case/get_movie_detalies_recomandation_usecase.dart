import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie_detalies_recomandation.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieDetaliesRecomandationUseCase {
  final BaseMovieRepository baseMovieRepository;

  const GetMovieDetaliesRecomandationUseCase(this.baseMovieRepository);

  Future<Either<Failur, List<MovieDetaliesRecomandation>>> excute(
      GetDetaliesRecomandationParametares recomandation) async {
    return await baseMovieRepository.getDetaliesRecomandation(recomandation);
  }
}

class GetDetaliesRecomandationParametares extends Equatable {
  final int id;

  const GetDetaliesRecomandationParametares({required this.id});

  @override
  List<Object?> get props => [id];
}
