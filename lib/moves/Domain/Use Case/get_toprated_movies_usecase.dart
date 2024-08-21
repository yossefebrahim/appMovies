import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);
  Future<Either<Failur, List<Movie>>> excute() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
