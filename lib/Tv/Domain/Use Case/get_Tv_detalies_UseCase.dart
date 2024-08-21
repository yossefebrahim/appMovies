import 'package:cleanarcitecturemmoveapp/Tv/Domain/Entities/tv_detalies.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Repository/base_tv_repository.dart';
import 'package:cleanarcitecturemmoveapp/core/network/failur.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetTvDetaliesUseCase {
  final BaseTvRepository baseTvRepository;

  GetTvDetaliesUseCase(this.baseTvRepository);

  Future<Either<Failur, TvDetalies>> excute(
      GetTvDetaliesParametares idtv) async {
    return await baseTvRepository.getTvDetalies(idtv);
  }
}

class GetTvDetaliesParametares extends Equatable {
  final int id;

  const GetTvDetaliesParametares({required this.id});

  @override
  List<Object?> get props => [id];
}
