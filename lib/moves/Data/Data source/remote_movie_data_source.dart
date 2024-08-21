import 'package:cleanarcitecturemmoveapp/core/Api/api_constance.dart';
import 'package:cleanarcitecturemmoveapp/core/Expation/expation.dart';
import 'package:cleanarcitecturemmoveapp/core/network/error_message.dart';
import 'package:cleanarcitecturemmoveapp/moves/Data/Model/movie_detalies_model.dart';
import 'package:cleanarcitecturemmoveapp/moves/Data/Model/movie_model.dart';
import 'package:cleanarcitecturemmoveapp/moves/Data/Model/recomandation_model.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_movie_detalies_recomandation_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_movie_detalies_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovise();
  Future<List<MovieModel>> getTopRatedMovise();
  Future<MovieDetaliesModel> getMovieDetalies(GetDetaliesParametares detalies);
  Future<List<RecomandationModel>> getMovieDetaliesRecomandation(
      GetDetaliesRecomandationParametares recomandation);
}

class RemoteMovieDataSource extends BaseRemoteMovieDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(ApiConstance.nowPlayingBaseUrl);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExpation(
          errorMessageModel: ErrorMessageModel.fromJson((response.data)));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovise() async {
    final response = await Dio().get(ApiConstance.popularBaseUrl);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExpation(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovise() async {
    final response = await Dio().get(ApiConstance.topRatedBaseUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExpation(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetaliesModel> getMovieDetalies(
      GetDetaliesParametares detalies) async {
    final response =
        await Dio().get(ApiConstance.moveDetailesUrlBase(detalies.id));
    if (response.statusCode == 200) {
      return MovieDetaliesModel.fromJson(response.data);
    } else {
      throw ServerExpation(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecomandationModel>> getMovieDetaliesRecomandation(
      GetDetaliesRecomandationParametares recomandation) async {
    final response =
        await Dio().get(ApiConstance.recomandationUrlBase(recomandation.id));
    if (response.statusCode == 200) {
      return List<RecomandationModel>.from((response.data["results"] as List)
          .map((e) => RecomandationModel.fromJson(e)));
    } else {
      throw ServerExpation(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
