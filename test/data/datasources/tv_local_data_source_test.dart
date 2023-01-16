import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:ditonton/data/models/tv_show_table.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TvLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = TvLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertTvWatchlist(testTvTable.toJson()))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchlist(testTvTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertTvWatchlist(testTvTable.toJson()))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlist(testTvTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeTvWatchlist(testTvTable.toJson()))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlist(testTvTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeTvWatchlist(testTvTable.toJson()))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlist(testTvTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get TvShow Detail By Id', () {
    final tId = 1;

    test('should return TvShow Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getTvById(tId))
          .thenAnswer((_) async => testTvMap);
      // act
      final result = await dataSource.getTvById(tId);
      // assert
      expect(result, testTvTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getTvById(tId)).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist TvShow', () {
    test('should return list of TvShowTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistTvs())
          .thenAnswer((_) async => [testTvMap]);
      // act
      final result = await dataSource.getWatchlistTvs();
      // assert
      expect(result, [TVShowTable.fromMap(testTvMap)]);
    });
  });

  group('cache now playing TvShow', () {
    test('should call database helper to save data', () async {
      // arrange
      when(mockDatabaseHelper.clearCacheTv('now playing'))
          .thenAnswer((_) async => 1);
      // act
      await dataSource.cacheNowPlayingTvs([testTvCache]);
      // assert
      verify(mockDatabaseHelper.clearCacheTv('now playing'));
      verify(mockDatabaseHelper
          .insertCacheTransactionTv([testTvCache.toJson()], 'now playing'));
    });

    test('should return list of TvShow from db when data exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheTvs('now playing'))
          .thenAnswer((_) async => [testTvCacheMap]);
      // act
      final result = await dataSource.getCachedNowPlayingTvs();
      // assert
      expect(result, [testTvCache]);
    });

    test('should throw CacheException when cache data is not exist', () async {
      // arrange
      when(mockDatabaseHelper.getCacheTvs('now playing'))
          .thenAnswer((_) async => []);
      // act
      final call = dataSource.getCachedNowPlayingTvs();
      // assert
      expect(() => call, throwsA(isA<CacheException>()));
    });
  });
}
