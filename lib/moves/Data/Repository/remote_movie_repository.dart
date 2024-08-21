import 'package:cleanarcitecturemmoveapp/core/Expation/expation.dart';
import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:cleanarcitecturemmoveapp/moves/Data/Data%20source/remote_movie_data_source.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie_detalies.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Entities/movie_detalies_recomandation.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Repository/base_movie_repository.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_movie_detalies_recomandation_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_movie_detalies_usecase.dart';
import 'package:dartz/dartz.dart';

class RemoteMovieRepository extends BaseMovieRepository {
  final BaseRemoteMovieDataSource baseRemoteMovieDataSource;

  RemoteMovieRepository(this.baseRemoteMovieDataSource);

  @override
  Future<Either<Failur, List<Movie>>> getNowPlayingMovie() async {
    final reslut = await baseRemoteMovieDataSource.getNowPlayingMovie();

    try {
      return right(reslut);
    } on ServerExpation catch (Failur) {
      return left(ServerFailur(Failur.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<Movie>>> getTopRatedMovies() async {
    final reslut = await baseRemoteMovieDataSource.getTopRatedMovise();

    try {
      return right(reslut);
    } on ServerExpation catch (Failur) {
      return left(ServerFailur(Failur.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<Movie>>> getPopularMovies() async {
    final reslut = await baseRemoteMovieDataSource.getPopularMovise();

    try {
      return right(reslut);
    } on ServerExpation catch (Failur) {
      return left(ServerFailur(Failur.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failur, MovieDetalies>> getMovieDetalies(
      GetDetaliesParametares detalies) async {
    final reslut = await baseRemoteMovieDataSource.getMovieDetalies(detalies);
    // print("======= reslut getMovieDetalies ${reslut} ========");

    try {
      return right(reslut);
    } on ServerExpation catch (Failur) {
      return left(ServerFailur(Failur.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<MovieDetaliesRecomandation>>>
      getDetaliesRecomandation(
          GetDetaliesRecomandationParametares recomandation) async {
    final reslut = await baseRemoteMovieDataSource
        .getMovieDetaliesRecomandation(recomandation);
    // print("======= reslut getDetaliesRecomandation ${reslut} ========");

    try {
      return right(reslut);
    } on ServerExpation catch (Failur) {
      return left(ServerFailur(Failur.errorMessageModel.errorMessage));
    }
  }
}
