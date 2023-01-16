import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/season_model.dart';
import 'package:ditonton/data/models/tv_show_detail_response.dart';
import 'package:ditonton/data/models/tv_show_model.dart';
import 'package:ditonton/data/models/tv_show_table.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/repositories/tv_repository_impl.dart';
import 'package:ditonton/domain/entities/tv_show.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvRepositoryImpl repository;
  late MockTvRemoteDataSource mockRemoteDataSource;
  late MockTvLocalDataSource mockLocalDataSource;
  // late MockDatabaseHelper mockDatabaseHelper;
  late MockNetworkInfo mockNetworkInfo;

  mockNetworkInfo = MockNetworkInfo();

  setUp(() {
    mockRemoteDataSource = MockTvRemoteDataSource();
    mockLocalDataSource = MockTvLocalDataSource();
    repository = TvRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
      localDataSource: mockLocalDataSource,
    );
  });

  final tTvShowModel = TVShowModel(
    originCountry: [""],
    originalLanguage: "",
    originalName: "",
    // adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    // originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    firstAirDate: '2002-05-01',
    name: 'Spider-Man',
    // video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );

  final tTvShow = TvShow(
    originCountry: [""],
    originalLanguage: "",
    originalName: "",
    // adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    // originalTitle: 'Spider-Man',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    firstAirDate: '2002-05-01',
    name: 'Spider-Man',
    // video: false,
    voteAverage: 7.2,
    voteCount: 13507,
  );

  final tTvShowModelList = <TVShowModel>[tTvShowModel];
  final tTvShowList = <TvShow>[tTvShow];

  final testTvShowCache = TVShowTable(
    id: 557,
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    name: 'Spider-Man',
  );

  group('Now Playing TvShow', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getNowPlayingTvs()).thenAnswer((_) async => []);
      // act
      await repository.getNowPlayingTvShow();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('when device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getNowPlayingTvs())
            .thenAnswer((_) async => tTvShowModelList);
        // act
        final result = await repository.getNowPlayingTvShow();
        // assert
        verify(mockRemoteDataSource.getNowPlayingTvs());
        /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
        final resultList = result.getOrElse(() => []);
        expect(resultList, tTvShowList);
      });

      test(
          'should cache data locally when the call to remote data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getNowPlayingTvs())
            .thenAnswer((_) async => tTvShowModelList);
        // act
        await repository.getNowPlayingTvShow();
        // assert
        verify(mockRemoteDataSource.getNowPlayingTvs());
        verify(mockLocalDataSource.cacheNowPlayingTvs([testTvShowCache]));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getNowPlayingTvs())
            .thenThrow(ServerException());
        // act
        final result = await repository.getNowPlayingTvShow();
        // assert
        verify(mockRemoteDataSource.getNowPlayingTvs());
        expect(result, equals(Left(ServerFailure(''))));
      });
    });

    group('when device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when device is offline', () async {
        // arrange
        when(mockLocalDataSource.getCachedNowPlayingTvs())
            .thenAnswer((_) async => [testTvShowCache]);
        // act
        final result = await repository.getNowPlayingTvShow();
// assert
        verify(mockLocalDataSource.getCachedNowPlayingTvs());
        final resultList = result.getOrElse(() => []);
        expect(resultList, [testTvFromCache]);
      });

      test('should return CacheFailure when app has no cache', () async {
        // arrange
        when(mockLocalDataSource.getCachedNowPlayingTvs())
            .thenThrow(CacheException('No Cache'));
        // act
        final result = await repository.getNowPlayingTvShow();
        // assert
        verify(mockLocalDataSource.getCachedNowPlayingTvs());
        expect(result, Left(CacheFailure('No Cache')));
      });
    });
  });

  group('Popular TvShows', () {
    test('should return TvShow list when call to data source is success',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvs())
          .thenAnswer((_) async => tTvShowModelList);
      // act
      final result = await repository.getPopularTvShow();
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvShowList);
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvs()).thenThrow(ServerException());
      // act
      final result = await repository.getPopularTvShow();
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getPopularTvs())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getPopularTvShow();
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Top Rated TvShows', () {
    test('should return TvShow list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvs())
          .thenAnswer((_) async => tTvShowModelList);
      // act
      final result = await repository.getTopRatedTvShow();
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvShowList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvs()).thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedTvShow();
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getTopRatedTvs())
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTopRatedTvShow();
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get TvShow Detail', () {
    final tId = 1;
    final tTvShowResponse = TVShowDetailResponse(
      // adult: false,
      backdropPath: 'backdropPath',
      // budget: 100,
      episodeRunTime: [1],
      numberOfEpisodes: 1,
      numberOfSeasons: 1,
      seasons: [
        SeasonModel(
          id: 1,
          posterPath: "posterPath",
          seasonNumber: 1,
          episodeCount: 12,
          name: "",
          overview: "",
          airDate: ""
        )
      ],
      type: "",
      genres: [GenreModel(id: 1, name: 'Action')],
      homepage: "https://google.com",
      id: 1,
      // imdbId: 'imdb1',
      originalLanguage: 'en',
      originalName: 'originalTitle',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      firstAirDate: 'releaseDate',
      // revenue: 12000,
      // runtime: 120,
      status: 'Status',
      tagline: 'Tagline',
      name: 'title',
      // video: false,
      voteAverage: 1,
      voteCount: 1,
    );

    test(
        'should return TvShow data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getDetailTvs(tId))
          .thenAnswer((_) async => tTvShowResponse);
      // act
      final result = await repository.getDetailTvShow(tId);
      // assert
      verify(mockRemoteDataSource.getDetailTvs(tId));
      expect(result, equals(Right(testTvDetail)));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getDetailTvs(tId)).thenThrow(ServerException());
      // act
      final result = await repository.getDetailTvShow(tId);
      // assert
      verify(mockRemoteDataSource.getDetailTvs(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getDetailTvs(tId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getDetailTvShow(tId);
      // assert
      verify(mockRemoteDataSource.getDetailTvs(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get TvShow Recommendations', () {
    final tTvList = <TVShowModel>[];
    final tId = 1;

    test('should return data (TvShow list) when the call is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.getRecommendationsTvs(tId))
          .thenAnswer((_) async => tTvList);
      // act
      final result = await repository.getRecommendationsTvShow(tId);
      // assert
      verify(mockRemoteDataSource.getRecommendationsTvs(tId));
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tTvList));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getRecommendationsTvs(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getRecommendationsTvShow(tId);
      // assertbuild runner
      verify(mockRemoteDataSource.getRecommendationsTvs(tId));
      expect(result, equals(Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getRecommendationsTvs(tId))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getRecommendationsTvShow(tId);
      // assert
      verify(mockRemoteDataSource.getRecommendationsTvs(tId));
      expect(result,
          equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Seach TvShows', () {
    final tQuery = 'spiderman';

    test('should return TvShow list when call to data source is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvs(tQuery))
          .thenAnswer((_) async => tTvShowModelList);
      // act
      final result = await repository.searchTvShow(tQuery);
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvShowList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvs(tQuery)).thenThrow(ServerException());
      // act
      final result = await repository.searchTvShow(tQuery);
      // assert
      expect(result, Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockRemoteDataSource.searchTvs(tQuery))
          .thenThrow(SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchTvShow(tQuery);
      // assert
      expect(
          result, Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('save watchlist', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(testTvTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlistTvShow(testTvDetail);
      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(testTvTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlistTvShow(testTvDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(testTvTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlistTvShow(testTvDetail);
      // assert
      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(testTvTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlistTvShow(testTvDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1;
      when(mockLocalDataSource.getTvById(tId)).thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlistTvShow(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist tv', () {
    test('should return list of Tv Show', () async {
      // arrange
      when(mockLocalDataSource.getWatchlistTvs())
          .thenAnswer((_) async => [testTvTable]);
      // act
      final result = await repository.getWatchlistTvShow();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTv]);
    });
  });
}
