import 'package:cleanarcitecturemmoveapp/Tv/Data/Data%20source/remote_Tv_data_source.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_detalies.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_detalies_recomandation.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_show.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Repository/base_tv_repository.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_Tv_detalies_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_Tv_detalies_reacomandation_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/core/Expation/expation.dart';
import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:dartz/dartz.dart';

class RemoteTvRepository extends BaseTvRepository {
  final BaseRemoteTvDataSource baseRemoteTvDataSource;

  RemoteTvRepository(this.baseRemoteTvDataSource);

  @override
  Future<Either<Failur, List<TvShow>>> getOnTheAirTv() async {
    final reslut = await baseRemoteTvDataSource.getOnTheAirTv();

    try {
      return right(reslut);
    } on ServerExpation catch (Failur) {
      return left(ServerFailur(Failur.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<TvShow>>> getPopularTv() async {
    final reslut = await baseRemoteTvDataSource.getPopularTv();
    try {
      return right(reslut);
    } on ServerExpation catch (Failur) {
      return left(ServerFailur(Failur.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<TvShow>>> getTopRatedTV() async {
    final reslut = await baseRemoteTvDataSource.getTopRatedTv();
    try {
      return right(reslut);
    } on ServerExpation catch (Failur) {
      return left(ServerFailur(Failur.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failur, TvDetalies>> getTvDetalies(
      GetTvDetaliesParametares idtv) async {
    final reslut = await baseRemoteTvDataSource.getTvDetalies(idtv);
    // print("======= reslut getMovieDetalies ${reslut} ========");

    try {
      return right(reslut);
    } on ServerExpation catch (Failur) {
      return left(ServerFailur(Failur.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<TvDetaliesRecomandation>>>
      getTVDetaliesRecomandattion(GetTvRecomandationParametares idtvRec) async {
    final reslut =
        await baseRemoteTvDataSource.getTvDetaliesRecomandation(idtvRec);
    // print(" +++++++ reslut getTVDetaliesRecomandattion ${reslut} ++++++++ ");
    try {
      return right(reslut);
    } on ServerExpation catch (Failur) {
      return left(ServerFailur(Failur.errorMessageModel.errorMessage));
    }
  }
}
