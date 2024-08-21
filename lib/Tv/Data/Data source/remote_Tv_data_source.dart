import 'dart:developer';

import 'package:cleanarcitecturemmoveapp/Tv/Data/Model/recomandation_tv_model.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Data/Model/tv_detalies_model.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Data/Model/tv_model.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_Tv_detalies_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_Tv_detalies_reacomandation_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/core/Api/api_constance.dart';
import 'package:cleanarcitecturemmoveapp/core/Expation/expation.dart';
import 'package:cleanarcitecturemmoveapp/core/network/error_message.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteTvDataSource {
  Future<List<TvModel>> getOnTheAirTv();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();
  Future<TvDetaliesModel> getTvDetalies(GetTvDetaliesParametares idtv);
  Future<List<RecomandationTvModel>> getTvDetaliesRecomandation(
      GetTvRecomandationParametares idtvRec);
}

class RemoteTvDataSource extends BaseRemoteTvDataSource {
  @override
  Future<List<TvModel>> getOnTheAirTv() async {
    final response = await Dio().get(ApiConstanceTv.onTheAirBaseUrl);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
        (response.data["results"] as List).map((e) => TvModel.fromJson(e)),
      );
    } else {
      throw ServerExpation(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getPopularTv() async {
    final response = await Dio().get(ApiConstanceTv.popularTvBaseUrl);
    // print(" getPopularTv  ${response}");

    if (response.statusCode == 200) {
      return List<TvModel>.from(
        (response.data["results"] as List).map((e) => TvModel.fromJson(e)),
      );
    } else {
      throw ServerExpation(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async {
    final response = await Dio().get(ApiConstanceTv.topRatedTvBaseUrl);
    // print(" getTopRatedTv  $response");
    if (response.statusCode == 200) {
      return List<TvModel>.from(
        (response.data["results"] as List).map((e) => TvModel.fromJson(e)),
      );
    } else {
      throw ServerExpation(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TvDetaliesModel> getTvDetalies(GetTvDetaliesParametares idtv) async {
    final response = await Dio().get(ApiConstanceTv.tvDetailesUrlBase(idtv.id));
    log("response getTvDetalies  ${response}");
    if (response.statusCode == 200) {
      return TvDetaliesModel.fromJson(response.data);
    } else {
      throw ServerExpation(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecomandationTvModel>> getTvDetaliesRecomandation(
      GetTvRecomandationParametares idtvRec) async {
    final response =
        await Dio().get(ApiConstanceTv.tvrecomandationUrlBase(idtvRec.id));
    print("response getTvDetaliesRecomandation  ${response}");

    if (response.statusCode == 200) {
      return List<RecomandationTvModel>.from(
        (response.data["results"] as List)
            .map((e) => RecomandationTvModel.fromJson(e)),
      );
    } else {
      throw ServerExpation(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
