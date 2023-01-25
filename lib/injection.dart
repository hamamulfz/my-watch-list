import 'package:core/common/utils/network_info.dart';
import 'package:core/domain/usecases/movie/search_movies.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/datasources/movie_local_data_source.dart';
import 'package:core/data/datasources/movie_remote_data_source.dart';
import 'package:core/data/datasources/tv_local_data_source.dart';
import 'package:core/data/datasources/tv_remote_data_source.dart';
import 'package:core/data/repositories/movie_repository_impl.dart';
import 'package:core/data/repositories/tv_repository_impl.dart';
import 'package:core/domain/repositories/movie_repository.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';
import 'package:core/domain/usecases/movie/get_movie_detail.dart';
import 'package:core/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:core/domain/usecases/movie/get_movies_now_playing.dart';
import 'package:core/domain/usecases/movie/get_movies_popular.dart';
import 'package:core/domain/usecases/movie/get_movies_top_rated.dart';
import 'package:core/domain/usecases/tv/get_tv_detail.dart';
import 'package:core/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:core/domain/usecases/tv/get_tv_watchlist.dart';
import 'package:core/domain/usecases/tv/get_tv_watchlist_status.dart';
import 'package:core/domain/usecases/tv/get_tvs_now_playing.dart';
import 'package:core/domain/usecases/tv/get_tvs_popular.dart';
import 'package:core/domain/usecases/tv/get_tvs_top_rated.dart';
import 'package:core/domain/usecases/movie/get_movies_watchlist.dart';
import 'package:core/domain/usecases/movie/get_movie_watchlist_status.dart';
import 'package:core/domain/usecases/movie/remove_movie_watchlist.dart';
import 'package:core/domain/usecases/movie/save_movie_watchlist.dart';

import 'package:core/domain/usecases/tv/remove_tv_watchlist.dart';
import 'package:core/domain/usecases/tv/save_tv_watchlist.dart';
import 'package:core/domain/usecases/tv/search_tv.dart';
import 'package:movie/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:movie/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:movie/presentation/bloc/movie_recommendation/movie_recommendation_bloc.dart';
import 'package:movie/presentation/bloc/movie_search/movie_search_bloc.dart';
import 'package:movie/presentation/bloc/movie_top_rated/movie_top_rated_bloc.dart';
import 'package:movie/presentation/bloc/movie_watchlist/movie_watchlist_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:ssl_pinning/network_ssl_pinning.dart';
import 'package:tv_show/presentation/bloc/tv_show_detail/tv_show_detail_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_now_playing/tv_show_now_playing_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_popular/tv_show_popular_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_recommendation/tv_show_recommendation_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_search/tv_show_search_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_top_rated/tv_show_top_rated_bloc.dart';
import 'package:tv_show/presentation/bloc/tv_show_watchlist/tv_show_watchlist_bloc.dart';

final locator = GetIt.instance;

void init() {
  // provider
  // locator.registerFactory(
  //   () => MovieListNotifier(
  //     getNowPlayingMovies: locator(),
  //     getPopularMovies: locator(),
  //     getTopRatedMovies: locator(),
  //   ),
  // );

  // locator.registerFactory(
  //   () => TvListNotifier(
  //     getNowPlayingTvs: locator(),
  //     getPopularTvs: locator(),
  //     getTopRatedTvs: locator(),
  //   ),
  // );

  locator.registerFactory(
    () => MovieRecommendationBloc(
      locator(),
      // getMovieRecommendations: locator(),
      // getWatchListStatus: locator(),
      // saveWatchlist: locator(),
      // removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => TvShowRecommendationBloc(
      locator(),
      // getMovieRecommendations: locator(),
      // getWatchListStatus: locator(),
      // saveWatchlist: locator(),
      // removeWatchlist: locator(),
    ),
  );

  locator.registerFactory(
    () => MovieDetailBloc(
      locator(),
      // getMovieRecommendations: locator(),
      // getWatchListStatus: locator(),
      // saveWatchlist: locator(),
      // removeWatchlist: locator(),
    ),
  );


  locator.registerFactory(
    () => TvShowDetailBloc(
      locator(),
      // getTvRecommendations: locator(),
      // getWatchListStatus: locator(),
      // saveWatchlist: locator(),
      // removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvShowSearchBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MoviePopularBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieNowPlayingBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvShowNowPlayingBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvShowPopularBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieTopRatedBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvShowTopRatedBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => MovieWatchlistBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => TvShowWatchlistBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetMoviesNowPlaying(locator()));
  locator.registerLazySingleton(() => GetMoviesPopular(locator()));
  locator.registerLazySingleton(() => GetMoviesTopRated(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetMovieWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => GetMoviesWatchlist(locator()));

  locator.registerLazySingleton(() => GetTvsNowPlaying(locator()));
  locator.registerLazySingleton(() => GetTvsPopular(locator()));
  locator.registerLazySingleton(() => GetTvsTopRated(locator()));
  locator.registerLazySingleton(() => GetTvDetail(locator()));
  locator.registerLazySingleton(() => GetTvRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTv(locator()));
  locator.registerLazySingleton(() => GetTvWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveTvWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveTvWatchlist(locator()));
  locator.registerLazySingleton(() => GetTvWatchlist(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );
  locator.registerLazySingleton<TvShowRepository>(
    () => TvRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvRemoteDataSource>(
      () => TvRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvLocalDataSource>(
      () => TvLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // network info
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
  // NetworkSslPinning.client);

  locator.registerLazySingleton(() => DataConnectionChecker());
}
