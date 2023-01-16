import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_watchlist.dart';
import 'package:ditonton/presentation/provider/tv/tv_watchlist_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_watchlist_notifier_test.mocks.dart';

@GenerateMocks([GetTvWatchlist])
void main() {
  late TvWatchlistNotifier provider;
  late MockGetTvWatchlist mockGetWatchlistMovies;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetWatchlistMovies = MockGetTvWatchlist();
    provider = TvWatchlistNotifier(
      getWatchlistTvs: mockGetWatchlistMovies,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetWatchlistMovies.execute())
        .thenAnswer((_) async => Right([testWatchlistTv]));
    // act
    await provider.fetchWatchlistTvs();
    // assert
    expect(provider.watchlistState, RequestState.Loaded);
    expect(provider.watchlistTvs, [testWatchlistTv]);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetWatchlistMovies.execute())
        .thenAnswer((_) async => Left(DatabaseFailure("Can't get data")));
    // act
    await provider.fetchWatchlistTvs();
    // assert
    expect(provider.watchlistState, RequestState.Error);
    expect(provider.message, "Can't get data");
    expect(listenerCallCount, 2);
  });
}
