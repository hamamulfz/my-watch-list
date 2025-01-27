import 'dart:io';

import 'package:core/common/utils/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:core/data/datasources/tv_local_data_source.dart';
import 'package:core/data/datasources/tv_remote_data_source.dart';
import 'package:core/data/models/tv_show_table.dart';
import 'package:core/domain/entities/tv_show.dart';
import 'package:core/domain/entities/tv_show_detail.dart';
import 'package:core/common/utils/exception.dart';
import 'package:core/common/utils/failure.dart';
import 'package:core/domain/repositories/tv_show_repository.dart';

class TvRepositoryImpl implements TvShowRepository {
  final TvRemoteDataSource remoteDataSource;
  final TvLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TvRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<TvShow>>> getNowPlayingTvShow() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getNowPlayingTvs();
        localDataSource.cacheNowPlayingTvs(
            result.map((tvShow) => TVShowTable.fromDTO(tvShow)).toList());
        return Right(result.map((model) => model.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure(''));
      } on TlsException {
        return const Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
      } on SocketException {
        return const Left(
            ConnectionFailure('Failed to connect to the network'));
      }
    } else {
      try {
        final result = await localDataSource.getCachedNowPlayingTvs();
        return Right(result.map((model) => model.toEntity()).toList());
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, TVShowDetail>> getDetailTvShow(int id) async {
    try {
      final result = await remoteDataSource.getDetailTvs(id);
      return Right(result.toEntity());
    } on TlsException {
      return const Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getRecommendationsTvShow(int id) async {
    try {
      final result = await remoteDataSource.getRecommendationsTvs(id);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getPopularTvShow() async {
    try {
      final result = await remoteDataSource.getPopularTvs();
      return Right(result.map((model) => model.toEntity()).toList());
    } on TlsException {
      return const Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getTopRatedTvShow() async {
    try {
      final result = await remoteDataSource.getTopRatedTvs();
      return Right(result.map((model) => model.toEntity()).toList());
    } on TlsException {
      return const Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> searchTvShow(String query) async {
    try {
      final result = await remoteDataSource.searchTvs(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on TlsException {
      return const Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlistTvShow(
      TVShowDetail tvShow) async {
    try {
      final result =
          await localDataSource.insertWatchlist(TVShowTable.fromEntity(tvShow));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlistTvShow(
      TVShowDetail tvShow) async {
    try {
      final result =
          await localDataSource.removeWatchlist(TVShowTable.fromEntity(tvShow));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> isAddedToWatchlistTvShow(int id) async {
    final result = await localDataSource.getTvById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<TvShow>>> getWatchlistTvShow() async {
    final result = await localDataSource.getWatchlistTvs();
    return Right(result.map((data) => data.toEntity()).toList());
  }
}
