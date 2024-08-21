import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_detalies.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_detalies_recomandation.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_show.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_Tv_detalies_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_Tv_detalies_reacomandation_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:dartz/dartz.dart';

abstract class BaseTvRepository {
  Future<Either<Failur, List<TvShow>>> getOnTheAirTv();
  Future<Either<Failur, List<TvShow>>> getPopularTv();
  Future<Either<Failur, List<TvShow>>> getTopRatedTV();
  Future<Either<Failur, TvDetalies>> getTvDetalies(
      GetTvDetaliesParametares idtv);
  Future<Either<Failur, List<TvDetaliesRecomandation>>>
      getTVDetaliesRecomandattion(GetTvRecomandationParametares idtvRec);
}
