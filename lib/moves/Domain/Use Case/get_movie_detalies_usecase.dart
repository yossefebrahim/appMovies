import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie_detalies.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieDetaliesUseCase {
  final BaseMovieRepository baseMovieRepository;

  const GetMovieDetaliesUseCase(this.baseMovieRepository);

  Future<Either<Failur, MovieDetalies>> excute(
      GetDetaliesParametares detalies) async {
    return await baseMovieRepository.getMovieDetalies(detalies);
  }
}

class GetDetaliesParametares extends Equatable {
  final int id;

  const GetDetaliesParametares({required this.id});

  @override
  List<Object?> get props => [id];
}
