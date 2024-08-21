import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie_detalies.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie_detalies_recomandation.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_movie_detalies_recomandation_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_movie_detalies_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMovieRepository {
  Future<Either<Failur, List<Movie>>> getNowPlayingMovie();
  Future<Either<Failur, List<Movie>>> getPopularMovies();
  Future<Either<Failur, List<Movie>>> getTopRatedMovies();
  Future<Either<Failur, MovieDetalies>> getMovieDetalies(
      GetDetaliesParametares detalies);
  Future<Either<Failur, List<MovieDetaliesRecomandation>>>
      getDetaliesRecomandation(
          GetDetaliesRecomandationParametares recomandation);
}
