import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_show.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Repository/base_tv_repository.dart';
import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:dartz/dartz.dart';

class GetOnTheAirTvUseCase {
  final BaseTvRepository baseTvRepository;

  GetOnTheAirTvUseCase(this.baseTvRepository);

  Future<Either<Failur, List<TvShow>>> excute() async {
    return await baseTvRepository.getOnTheAirTv();
  }
}
