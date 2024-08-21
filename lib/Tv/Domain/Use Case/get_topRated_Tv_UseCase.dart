import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_show.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Repository/base_tv_repository.dart';
import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedTvUseCase {
  final BaseTvRepository baseTvRepository;

  GetTopRatedTvUseCase(this.baseTvRepository);

  Future<Either<Failur, List<TvShow>>> excute() async {
    return await baseTvRepository.getTopRatedTV();
  }
}
