import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:ditonton/domain/entities/tv_show_detail.dart';

abstract class TvShowRepository {
  Future<Either<Failure, List<TvShow>>> getNowPlayingTvShow();
  Future<Either<Failure, List<TvShow>>> getPopularTvShow();
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShow();
  Future<Either<Failure, TVShowDetail>> getDetailTvShow(int id);
  Future<Either<Failure, List<TvShow>>> getRecommendationsTvShow(int id);
  Future<Either<Failure, List<TvShow>>> searchTvShow(String query);
  Future<Either<Failure, String>> saveWatchlistTvShow(TVShowDetail tvShow);
  Future<Either<Failure, String>> removeWatchlistTvShow(TVShowDetail tvShow);
  Future<bool> isAddedToWatchlistTvShow(int id);
  Future<Either<Failure, List<TvShow>>> getWatchlistTvShow();
}
