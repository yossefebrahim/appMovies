import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_detalies_recomandation.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Repository/base_tv_repository.dart';
import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetTvDetaliesRecomandationUseCase {
  final BaseTvRepository baseTvRepository;

  GetTvDetaliesRecomandationUseCase(this.baseTvRepository);
  Future<Either<Failur, List<TvDetaliesRecomandation>>> excute(
      GetTvRecomandationParametares idtvRec) async {
    return await baseTvRepository.getTVDetaliesRecomandattion(idtvRec);
  }
}

class GetTvRecomandationParametares extends Equatable {
  final int id;

  const GetTvRecomandationParametares({required this.id});

  @override
  List<Object?> get props => [id];
}
