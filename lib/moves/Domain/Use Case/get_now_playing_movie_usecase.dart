import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Repository/base_movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMovieUseCase(this.baseMovieRepository);
  Future<Either<Failur, List<Movie>>> excute() async {
    return await baseMovieRepository.getNowPlayingMovie();
  }
}
