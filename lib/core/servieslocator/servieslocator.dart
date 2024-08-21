import 'package:cleanarcitecturemmoveapp/Tv/Data/Data%20source/remote_Tv_data_source.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Data/Repository/remote_tv_repository.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Repository/base_tv_repository.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_Tv_detalies_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_Tv_detalies_reacomandation_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_onTheAir_Tv_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_popular_Tv_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Domain/Use%20Case/get_topRated_Tv_UseCase.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontroller/tv_bloc.dart';
import 'package:cleanarcitecturemmoveapp/Tv/Presentation/controller/tvcontrollerdetalies/tv_detalies_bloc.dart';
import 'package:cleanarcitecturemmoveapp/moves/Data/Data%20source/remote_movie_data_source.dart';
import 'package:cleanarcitecturemmoveapp/moves/Data/Repository/remote_movie_repository.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Repository/base_movie_repository.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_movie_detalies_recomandation_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_movie_detalies_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_now_playing_movie_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_popular_movies_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/Domain/Use%20Case/get_toprated_movies_usecase.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviecontroller/movie_block.dart';
import 'package:cleanarcitecturemmoveapp/moves/presentation/controller/moviesdetilescontroller/movie_detalies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiesLocator {
  void intil() {
    //BLOC
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));

    sl.registerFactory(() => MovieDetaliesBloc(sl(), sl()));

    sl.registerFactory(() => TvBloc(sl(), sl(), sl()));

    sl.registerFactory(() => TvDetaliesBloc(sl(), sl()));

    //DATA SOURCES
    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => RemoteMovieDataSource());

    sl.registerLazySingleton<BaseRemoteTvDataSource>(
        () => RemoteTvDataSource());
    //REpositry
    sl.registerLazySingleton<BaseMovieRepository>(
        () => RemoteMovieRepository(sl()));

    sl.registerLazySingleton<BaseTvRepository>(() => RemoteTvRepository(sl()));
    //USECASE
    sl.registerLazySingleton(() => GetNowPlayingMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetaliesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetaliesRecomandationUseCase(sl()));

    sl.registerLazySingleton(() => GetOnTheAirTvUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvUseCase(sl()));
    sl.registerLazySingleton(() => GetTvDetaliesUseCase(sl()));
    sl.registerLazySingleton(() => GetTvDetaliesRecomandationUseCase(sl()));
  }
}
